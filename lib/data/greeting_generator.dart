/// Gerador PROCEDURAL de MENSAGENS EVANGÉLICAS — SEM IA, offline. Conteúdo
/// original e devocional. Índice espalhado (começo/fim mudam a cada frase).
class GreetingGenerator {
  GreetingGenerator._();

  static const List<String> _open = [
    'Hoje,',
    'Confie:',
    'Creia:',
    'Lembre-se:',
    'Na fé,',
    'Com Deus,',
    'Apesar de tudo,',
    'Nos dias difíceis,',
    'A verdade é que',
    'No Senhor,',
    'Acredite:',
    'Sempre que puder,',
    'Mesmo sem entender,',
    'A cada manhã,',
  ];

  static const List<String> _core = [
    'Deus tem o controle de tudo na sua vida',
    'a fé move montanhas e transforma corações',
    'o amor de Deus é maior que qualquer problema',
    'o Senhor renova as nossas forças a cada dia',
    'a promessa de Deus não falha, apenas amadurece',
    'Deus está preparando o melhor para você',
    'quem confia no Senhor jamais é envergonhado',
    'a paz de Deus excede todo entendimento',
    'Deus enxuga cada lágrima e restaura cada sonho',
    'para Deus não existe causa perdida',
    'a esperança em Deus jamais decepciona',
    'o Senhor vai à frente preparando o caminho',
    'com Deus, o impossível se torna possível',
    'você é amado e precioso aos olhos de Deus',
    'a graça de Deus se renova a cada manhã',
    'onde há fé, sempre há esperança e vitória',
  ];

  static const List<String> _close = [
    'Confie em Deus.',
    'Ele nunca falha.',
    'Tenha fé.',
    'Deus é fiel.',
    'Espere no Senhor.',
    'Deus proverá.',
    'Não desista.',
    'Bendito seja Deus.',
    'Glória a Deus.',
    'Deus abençoe você.',
    'A paz do Senhor.',
    'Amém!',
  ];

  static int get total => _open.length * _core.length * _close.length;

  static String byIndex(int i) {
    final n = i.abs();
    final o = _open[n % _open.length];
    final c = _core[(n ~/ _open.length) % _core.length];
    final f = _close[n % _close.length];
    return '$o $c. $f';
  }

  /// Mensagem do dia (determinística).
  static String ofNow([DateTime? date]) {
    final d = date ?? DateTime.now();
    final dayIndex =
        DateTime(d.year, d.month, d.day).difference(DateTime(2020, 1, 1)).inDays;
    return byIndex(dayIndex * 7919);
  }
}
