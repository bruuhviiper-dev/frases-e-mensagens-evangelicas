/// Fundos-foto GRÁTIS do editor de imagem (seção "Fotos" da tela Criar).
///
/// As imagens vêm do Lorem Picsum (fotos do Unsplash — licença livre para uso
/// comercial: https://unsplash.com/license). Os ids foram CURADOS manualmente
/// (conferidos um a um): só paisagens/natureza, nada de pessoas/animais que
/// altere a classificação do app.
///
/// São carregadas da internet e cacheadas no disco pelo `cached_network_image`.
/// Depois de abertas 1x, seguem disponíveis mesmo SEM internet.
class PhotoBackground {
  const PhotoBackground(this.id);

  /// Id estável da foto no Picsum.
  final String id;

  /// Imagem em alta para o fundo do cartão (story 9:16, com folga para os
  /// formatos quadrado/retrato via BoxFit.cover).
  String get full => 'https://picsum.photos/id/$id/1080/1920';

  /// Miniatura leve para o seletor.
  String get thumb => 'https://picsum.photos/id/$id/160/240';
}

/// Catálogo curado de fundos-foto com clima ROMÂNTICO (pôr do sol, tons quentes,
/// dourados, luzes da cidade) — combina com o tema de amor. Licença Unsplash.
const photoBackgrounds = <PhotoBackground>[
  PhotoBackground('1057'), // costa ao pôr do sol
  PhotoBackground('1053'), // pôr do sol no mar
  PhotoBackground('1016'), // cânion no fim de tarde (dourado)
  PhotoBackground('1015'), // fiorde ao entardecer
  PhotoBackground('1062'), // outono dourado
  PhotoBackground('1042'), // vale ao entardecer
  PhotoBackground('1072'), // deserto ao entardecer
  PhotoBackground('1073'), // dunas quentes
  PhotoBackground('1074'), // campo dourado
  PhotoBackground('1031'), // campo dourado ao sol
  PhotoBackground('1080'), // vinhedos ao pôr do sol
  PhotoBackground('1082'), // campo florido
  PhotoBackground('1083'), // montanha ao amanhecer (rosado)
  PhotoBackground('1035'), // pico ao amanhecer
  PhotoBackground('1069'), // lago espelhado ao entardecer
  PhotoBackground('1077'), // reflexo dourado no lago
  PhotoBackground('1050'), // cidade litorânea ao anoitecer
  PhotoBackground('1049'), // praia tropical dourada
  PhotoBackground('1061'), // praia serena ao pôr do sol
  PhotoBackground('1002'), // luzes da cidade à noite
  PhotoBackground('1071'), // céu de nuvens ao entardecer
  PhotoBackground('1084'), // costa e farol ao anoitecer
  PhotoBackground('1043'), // vale ao entardecer
  PhotoBackground('1056'), // vale ensolarado
  // ---- ampliação romântica ----
  PhotoBackground('1018'), // estrada ao entardecer
  PhotoBackground('1024'), // lago e montanhas ao anoitecer
  PhotoBackground('1039'), // vale com névoa dourada
  PhotoBackground('1044'), // floresta com névoa (clima intimista)
  PhotoBackground('1051'), // cais no lago ao pôr do sol
  PhotoBackground('1055'), // lago ao amanhecer rosado
  PhotoBackground('1064'), // névoa sobre colinas
  PhotoBackground('1065'), // costa dourada vista do alto
  PhotoBackground('1070'), // mata ao entardecer
  PhotoBackground('1013'), // costa rochosa ao anoitecer
  PhotoBackground('1023'), // campos ao entardecer
  PhotoBackground('1029'), // caminho na mata dourada
  PhotoBackground('1033'), // estrada no campo ao pôr do sol
  PhotoBackground('1004'), // alameda arborizada
  PhotoBackground('1047'), // ruela ao anoitecer
  PhotoBackground('1063'), // inverno rosado
  PhotoBackground('1076'), // luzes do horizonte urbano
  PhotoBackground('1075'), // praia e falésias douradas
];
