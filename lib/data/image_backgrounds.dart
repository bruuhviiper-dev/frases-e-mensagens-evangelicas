import 'package:flutter/material.dart';

/// 96 fundos-imagem ROMÂNTICOS (silhuetas de casal se olhando, corações,
/// corações entrelaçados, casal sob a lua, casal sentado, chuva de corações —
/// 8 cenas × 12 paletas × variações). Assets leves, offline. A identidade do app.
class ImageBackgrounds {
  ImageBackgrounds._();

  static List<String> get all => [
        for (var i = 1; i <= 96; i++)
          'assets/backgrounds/bg${i.toString().padLeft(2, '0')}.jpg',
      ];
}

/// Filtros de cor aplicados por cima do fundo (tinta translúcida). Dão a
/// sensação de "mais opções" sem precisar de mil imagens.
class CardFilters {
  CardFilters._();

  static const List<String> names = [
    'Original',
    'Quente',
    'Frio',
    'Rosé',
    'Vintage',
    'Escuro',
    'Claro',
  ];

  /// Cor da tinta do filtro [i] (0 = Original / sem filtro).
  static Color? color(int i) => switch (i) {
        1 => const Color(0x33FF7A18), // quente
        2 => const Color(0x332A6FFF), // frio
        3 => const Color(0x33FF3D8B), // rosé
        4 => const Color(0x40C9A24B), // vintage
        5 => const Color(0x59000000), // escuro
        6 => const Color(0x26FFFFFF), // claro
        _ => null,
      };
}
