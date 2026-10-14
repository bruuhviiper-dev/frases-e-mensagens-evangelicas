import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../data/app_info.dart';
import '../data/app_theme.dart';
import '../data/image_backgrounds.dart';
import '../data/photo_backgrounds.dart';
import '../data/story_backgrounds.dart';
import '../data/textures.dart';
import '../services/app_state.dart';

/// Editor PRO: cria uma frase como imagem (formatos, fontes, cores, sua foto,
/// assinatura e salvar na galeria). Recursos PRO liberados no premium.
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key, this.initialText, this.initialBg});

  /// Quando aberto a partir da galeria "Frases com Imagens".
  final String? initialText;
  final int? initialBg;

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _Format {
  const _Format(this.label, this.ratio);
  final String label;
  final double ratio;
}

class _CreateScreenState extends State<CreateScreen> {
  final _controller = TextEditingController();
  final _cardKey = GlobalKey();

  int _bg = 0;
  int _format = 0;
  int _font = 0;
  int _color = 0;
  String? _photoPath; // foto do usuário (galeria do celular)
  String? _photoUrl; // foto real (Unsplash/Picsum)
  int? _imageBg; // fundo-imagem offline
  int? _texture; // textura offline
  bool _busy = false;

  /// Limpa todas as fontes de "imagem" do fundo (deixa só o gradiente ativo).
  void _clearImages() {
    _photoPath = null;
    _photoUrl = null;
    _imageBg = null;
    _texture = null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialText != null) _controller.text = widget.initialText!;
    if (widget.initialBg != null) _bg = widget.initialBg!;
  }

  static const _formats = [
    _Format('Story', 9 / 16),
    _Format('Quadrado', 1),
    _Format('Retrato', 4 / 5),
  ];

  // 1ª fonte/cor são grátis; o resto é PRO.
  static const _fonts = [
    'Lora',
    'Montserrat',
    'Poppins',
    'Pacifico',
    'Oswald',
    'Dancing Script',
    'Bebas Neue',
    'Playfair Display',
  ];
  static const _colors = [
    Colors.white,
    Colors.black,
    Color(0xFFFFE066),
    Color(0xFFFF6B6B),
    Color(0xFF4ECDC4),
    Color(0xFFC026D3),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Padrão app2/app27: editor 100% grátis — nada é bloqueado.
  bool _pro(AppState s) => true;

  /// Editor 100% grátis (padrão app2/app27): nada é bloqueado, então este
  /// método nunca é chamado — mantido só para compatibilidade das chamadas.
  void _unlock(AppState s) {}

  Future<Uint8List?> _capture() async {
    final boundary =
        _cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final img = await boundary.toImage(pixelRatio: 3.5);
    final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
    return bytes?.buffer.asUint8List();
  }

  Future<void> _shareImage(bool noWatermark) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final bytes = await _capture();
      if (bytes == null) return;
      final dir = await getTemporaryDirectory();
      final file =
          File('${dir.path}/aniversario_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(bytes);
      await Share.shareXFiles([XFile(file.path)],
          text: noWatermark ? '' : '✝️ ${AppInfo.appName}\n${AppInfo.shareFooter}');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _saveGallery() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final bytes = await _capture();
      if (bytes == null) return;
      await Gal.putImageBytes(bytes, album: 'Frases Evangélicas');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Imagem salva na galeria! 📥')));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Não foi possível salvar.')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _pickPhoto() async {
    final x = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 90);
    if (x != null) {
      setState(() {
        _clearImages();
        _photoPath = x.path;
      });
    }
  }

  Future<void> _editSignature(AppState s) async {
    final c = TextEditingController(text: s.customSignature);
    final v = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sua assinatura'),
        content: TextField(
          controller: c,
          autofocus: true,
          decoration: const InputDecoration(hintText: '@seu_perfil ou seu nome'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, c.text),
              child: const Text('Salvar')),
        ],
      ),
    );
    if (v != null) s.setCustomSignature(v);
  }

  TextStyle _font_(Color color) => GoogleFonts.getFont(
        _fonts[_font],
        color: color,
        fontSize: 22,
        height: 1.4,
        fontWeight: FontWeight.w600,
        shadows: const [
          Shadow(color: Colors.black38, blurRadius: 10, offset: Offset(0, 2)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final pro = _pro(state);
    final bg = StoryBg.all[_bg];
    final color = _colors[_color];
    final text = _controller.text.trim().isEmpty
        ? 'Escreva a sua frase aqui...'
        : _controller.text.trim();

    // Prioridade do fundo: foto do usuário > foto real > fundo-imagem > textura.
    DecorationImage? bgImage;
    final bool hasPhotoOverlay = _photoPath != null || _photoUrl != null;
    if (_photoPath != null) {
      bgImage =
          DecorationImage(image: FileImage(File(_photoPath!)), fit: BoxFit.cover);
    } else if (_photoUrl != null) {
      bgImage = DecorationImage(
          image: CachedNetworkImageProvider(_photoUrl!), fit: BoxFit.cover);
    } else if (_imageBg != null) {
      bgImage = DecorationImage(
          image: AssetImage(ImageBackgrounds.all[_imageBg!]), fit: BoxFit.cover);
    } else if (_texture != null) {
      bgImage = DecorationImage(
          image: AssetImage(Textures.all[_texture!]), fit: BoxFit.cover);
    } else if (bg.isImage) {
      bgImage =
          DecorationImage(image: AssetImage(bg.asset!), fit: BoxFit.cover);
    }

    // Assinatura personalizada sempre aparece quando preenchida; senão marca
    // d'água do app (removível com "Remover anúncios"/compra).
    final sig = state.customSignature.isNotEmpty
        ? state.customSignature
        : (state.canRemoveWatermark ? '' : '✝️ Frases Evangélicas');

    return Scaffold(
      appBar: AppBar(title: const Text('Criar imagem')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 12, 16, 28 + MediaQuery.of(context).viewPadding.bottom),
        children: [
          // ---- Pré-visualização (vira a imagem) ----
          Center(
            child: SizedBox(
              width: 280,
              child: AspectRatio(
                aspectRatio: _formats[_format].ratio,
                child: RepaintBoundary(
                  key: _cardKey,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient:
                          bgImage == null ? AppTheme.gradient(bg.colors) : null,
                      image: bgImage,
                    ),
                    child: Stack(
                      children: [
                        if (hasPhotoOverlay)
                          Container(color: Colors.black.withValues(alpha: 0.28)),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(22),
                            child:
                                Text(text, textAlign: TextAlign.center, style: _font_(color)),
                          ),
                        ),
                        if (sig.isNotEmpty)
                          Positioned(
                            bottom: 14,
                            left: 0,
                            right: 0,
                            child: Text(sig,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: color.withValues(alpha: 0.85),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700)),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _controller,
            maxLines: 4,
            minLines: 2,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Escreva a sua frase...',
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 16),

          _proLabel(context, 'Formato', pro),
          Wrap(
            spacing: 8,
            children: [
              for (var i = 0; i < _formats.length; i++)
                ChoiceChip(
                  avatar: (i > 0 && !pro)
                      ? const Icon(Icons.lock_rounded, size: 14)
                      : null,
                  label: Text(_formats[i].label),
                  selected: _format == i,
                  onSelected: (_) =>
                      (i > 0 && !pro) ? _unlock(state) : setState(() => _format = i),
                ),
            ],
          ),
          const SizedBox(height: 14),

          _proLabel(context, 'Fontes', pro),
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _fonts.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final locked = i > 0 && !pro;
                final sel = _font == i;
                return ActionChip(
                  label: Text('Aa',
                      style: GoogleFonts.getFont(_fonts[i],
                          fontWeight: sel ? FontWeight.w800 : FontWeight.w500)),
                  avatar: locked
                      ? const Icon(Icons.lock_rounded, size: 14)
                      : null,
                  backgroundColor: sel
                      ? Theme.of(context).colorScheme.primaryContainer
                      : null,
                  onPressed: () =>
                      locked ? _unlock(state) : setState(() => _font = i),
                );
              },
            ),
          ),
          const SizedBox(height: 14),

          _proLabel(context, 'Cor do texto', pro),
          Row(
            children: [
              for (var i = 0; i < _colors.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => (i > 1 && !pro)
                        ? _unlock(state)
                        : setState(() => _color = i),
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: _colors[i],
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: _color == i
                                ? Theme.of(context).colorScheme.primary
                                : Colors.black26,
                            width: _color == i ? 3 : 1),
                      ),
                      child: (i > 1 && !pro)
                          ? const Icon(Icons.lock_rounded,
                              size: 14, color: Colors.black54)
                          : null,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),

          // ---- Fundos (gradientes + alguns temáticos) ----
          _proLabel(context, 'Fundos', pro),
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: StoryBg.all.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final b = StoryBg.all[i];
                final sel = !hasPhotoOverlay &&
                    _imageBg == null &&
                    _texture == null &&
                    _bg == i;
                return GestureDetector(
                  onTap: () => setState(() {
                    _bg = i;
                    _clearImages();
                  }),
                  child: Container(
                    width: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: b.isImage ? null : AppTheme.gradient(b.colors),
                      image: b.isImage
                          ? DecorationImage(
                              image: AssetImage(b.asset!), fit: BoxFit.cover)
                          : null,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: sel
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 3),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),

          // ---- Fundos-imagem (offline) ----
          _proLabel(context, 'Fundos-imagem', pro),
          SizedBox(
            height: 64,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ImageBackgrounds.all.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final sel = _imageBg == i;
                return GestureDetector(
                  onTap: () => setState(() {
                    _clearImages();
                    _imageBg = i;
                  }),
                  child: Container(
                    width: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: sel
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 3),
                      image: DecorationImage(
                          image: AssetImage(ImageBackgrounds.all[i]),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),

          // ---- Texturas (offline) ----
          _proLabel(context, 'Texturas', pro),
          SizedBox(
            height: 64,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: Textures.all.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final sel = _texture == i;
                return GestureDetector(
                  onTap: () => setState(() {
                    _clearImages();
                    _texture = i;
                  }),
                  child: Container(
                    width: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: sel
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 3),
                      image: DecorationImage(
                          image: AssetImage(Textures.all[i]), fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // ---- Fotos reais (grátis, online + cache) ----
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Text('Fotos reais',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xFF16A34A),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('GRÁTIS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: photoBackgrounds.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final pb = photoBackgrounds[i];
                final sel = _photoUrl == pb.full;
                return GestureDetector(
                  onTap: () => setState(() {
                    _clearImages();
                    _photoUrl = pb.full;
                  }),
                  child: Container(
                    width: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: sel
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 3),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pb.thumb,
                      fit: BoxFit.cover,
                      placeholder: (_, _) => const Center(
                          child: SizedBox(
                              width: 16,
                              height: 16,
                              child:
                                  CircularProgressIndicator(strokeWidth: 2))),
                      errorWidget: (_, _, _) =>
                          const Icon(Icons.broken_image_rounded, size: 18),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // ---- Ações PRO ----
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => pro ? _pickPhoto() : _unlock(state),
                  icon: Icon(pro
                      ? Icons.add_photo_alternate_rounded
                      : Icons.lock_rounded),
                  label: const Text('Sua foto'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => pro ? _editSignature(state) : _unlock(state),
                  icon: Icon(pro ? Icons.draw_rounded : Icons.lock_rounded),
                  label: const Text('Assinatura'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: _busy ? null : () => _shareImage(state.canRemoveWatermark),
            icon: _busy
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.share_rounded),
            label: const Text('Compartilhar imagem'),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: _busy ? null : () => pro ? _saveGallery() : _unlock(state),
            icon: Icon(pro ? Icons.download_rounded : Icons.lock_rounded),
            label: const Text('Salvar na galeria (HD)'),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {
              final t = _controller.text.trim();
              if (t.isNotEmpty) {
                Share.share('$t\n\n🎂 ${AppInfo.appName}\n${AppInfo.shareFooter}');
              }
            },
            icon: const Icon(Icons.text_fields_rounded),
            label: const Text('Compartilhar texto'),
          ),
        ],
      ),
    );
  }

  Widget _proLabel(BuildContext context, String t, bool pro) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Text(t, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: 8),
            if (!pro)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text('PRO',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800)),
              ),
          ],
        ),
      );
}
