import 'package:flutter/material.dart';

import 'models.dart';

/// Banco de FRASES E MENSAGENS EVANGÉLICAS (offline). Conteúdo 100% ORIGINAL,
/// devocional e respeitoso — NÃO reproduz traduções protegidas da Bíblia.
///
/// Cada categoria combina dois conjuntos de trechos (ideia × arremate),
/// gerando 120+ mensagens ÚNICAS por categoria — todas editáveis no app.
class VerseData {
  VerseData._();

  static const _fe = [Color(0xFF4776E6), Color(0xFF8E54E9)];
  static const _amordeus = [Color(0xFFf857a6), Color(0xFFff5858)];
  static const _gratidao = [Color(0xFFf7971e), Color(0xFFffd200)];
  static const _esperanca = [Color(0xFFf6d365), Color(0xFFfda085)];
  static const _bomdia = [Color(0xFFf6d365), Color(0xFFff9a44)];
  static const _boanoite = [Color(0xFF141E30), Color(0xFF243B55)];
  static const _oracao = [Color(0xFF667eea), Color(0xFF764ba2)];
  static const _protecao = [Color(0xFF334d50), Color(0xFF4776E6)];
  static const _bencaos = [Color(0xFF43cea2), Color(0xFF185a9d)];
  static const _perseveranca = [Color(0xFF3a7bd5), Color(0xFF3a6073)];
  static const _paz = [Color(0xFF2193b0), Color(0xFF6dd5ed)];
  static const _louvor = [Color(0xFF8E2DE2), Color(0xFF4A00E0)];
  static const _palavra = [Color(0xFF1e3c72), Color(0xFF2a5298)];
  static const _mensagens = [Color(0xFF614385), Color(0xFF516395)];
  static const _milagres = [Color(0xFF0f0c29), Color(0xFF302b63)];
  static const _reflexao = [Color(0xFF232526), Color(0xFF414345)];

  static List<Verse> _mix(List<String> a, List<String> b) {
    final total = a.length * b.length;
    final seen = <String>{};
    final out = <Verse>[];
    for (var i = 0; i < total; i++) {
      final t = '${a[i % a.length]} ${b[i % b.length]}';
      if (seen.add(t)) out.add(Verse(t));
    }
    return out;
  }

  // ---------------- FÉ ----------------
  static const _feA = [
    'A fé é a certeza no que os olhos ainda não veem.',
    'Confie: Deus está trabalhando mesmo no silêncio.',
    'Quando a fé fala, o medo se cala.',
    'Deus é fiel e nunca falha com quem espera nele.',
    'Mesmo sem entender, eu confio no plano de Deus.',
    'A fé move montanhas e transforma corações.',
    'Nos dias difíceis, a fé é o que me sustenta.',
    'Creia: o impossível para nós é possível para Deus.',
    'A fé não tira a tempestade, mas dá paz no meio dela.',
    'Deus tem o controle de tudo, entregue a ele.',
    'Onde há fé, há esperança e há vitória.',
    'Continue crendo, o milagre está a caminho.',
  ];
  static const _feB = [
    'Confie em Deus. 🙏',
    'Ele nunca falha.',
    'Tenha fé.',
    'Deus é fiel.',
    'Creia e verás.',
    'Nas mãos do Senhor.',
    'Deus proverá.',
    'Espere no Senhor.',
    'Ele cuida de você.',
    'Fé e vitória.',
    'Deus está no controle.',
    'Amém!',
  ];

  // ---------------- AMOR DE DEUS ----------------
  static const _amordeusA = [
    'O amor de Deus é maior que qualquer falha nossa.',
    'Você é amado por Deus exatamente como é.',
    'Nada pode nos separar do amor de Deus.',
    'O amor do Senhor se renova a cada manhã.',
    'Deus te ama com um amor que não tem fim.',
    'No amor de Deus encontramos o nosso descanso.',
    'O Pai celestial cuida de cada detalhe da sua vida.',
    'O amor de Deus cura, restaura e transforma.',
    'Você é filho amado do Rei dos reis.',
    'Deus te escolheu e te ama profundamente.',
    'Mesmo quando falhamos, o amor de Deus permanece.',
    'O amor de Deus é o abrigo do nosso coração.',
  ];
  static const _amordeusB = [
    'Deus te ama! ❤️',
    'Amor sem fim.',
    'Você é amado.',
    'O Pai cuida de você.',
    'Descanse nesse amor.',
    'Amor que restaura.',
    'Filho amado.',
    'Deus é amor.',
    'Grande é o seu amor.',
    'Amado por Deus.',
    'Para sempre amado.',
    'Amém!',
  ];

  // ---------------- GRATIDÃO A DEUS ----------------
  static const _gratidaoA = [
    'Obrigado, Senhor, por mais um dia de vida.',
    'Gratidão a Deus por cada bênção recebida.',
    'Agradeço ao Senhor pelo seu cuidado constante.',
    'Meu coração transborda gratidão a Deus.',
    'Grato por tudo o que já passou e pelo que virá.',
    'Deus é bom o tempo todo, e o tempo todo Deus é bom.',
    'Agradeço pela família, pela saúde e pela fé.',
    'Reconheço as bênçãos de Deus em cada detalhe.',
    'Gratidão pelo Senhor nunca me desamparar.',
    'Obrigado, Deus, pela graça que não merecia.',
    'A gratidão abre as portas do céu.',
    'Sou grato pela misericórdia que se renova todo dia.',
  ];
  static const _gratidaoB = [
    'Gratidão a Deus! 🙌',
    'Obrigado, Senhor.',
    'Deus é bom.',
    'Grato de coração.',
    'Toda honra a Deus.',
    'Bendito seja Deus.',
    'Aleluia!',
    'Deus é fiel.',
    'Glória a Deus.',
    'Grato sempre.',
    'Que Deus seja louvado.',
    'Amém!',
  ];

  // ---------------- ESPERANÇA ----------------
  static const _esperancaA = [
    'A esperança em Deus jamais decepciona.',
    'Depois da noite, Deus faz nascer um novo dia.',
    'Mantenha a esperança: o Senhor cumpre o que promete.',
    'Deus transforma o deserto em fonte de água viva.',
    'Onde há Deus, sempre há esperança.',
    'O melhor de Deus para a sua vida ainda está por vir.',
    'Não desanime: o Senhor renova as suas forças.',
    'A promessa de Deus não falha, apenas amadurece.',
    'Espere no Senhor e o seu coração se fortalecerá.',
    'Deus é o Deus da restauração e do recomeço.',
    'A esperança é a âncora da alma que confia em Deus.',
    'Confie: o que Deus prometeu, ele vai cumprir.',
  ];
  static const _esperancaB = [
    'Espere no Senhor. 🌅',
    'A promessa vem.',
    'Deus não falha.',
    'Há esperança.',
    'Confie e espere.',
    'O melhor vem aí.',
    'Deus restaura.',
    'Não desista.',
    'Fé e esperança.',
    'Deus é fiel.',
    'Renove as forças.',
    'Amém!',
  ];

  // ---------------- BOM DIA COM DEUS ----------------
  static const _bomdiaA = [
    'Bom dia! Que Deus abençoe o seu caminho hoje.',
    'Comece o dia entregando tudo nas mãos do Senhor.',
    'Bom dia! A misericórdia de Deus se renova esta manhã.',
    'Que o Senhor guie os seus passos neste novo dia.',
    'Desperte com gratidão: Deus te deu mais um dia.',
    'Bom dia! Que a paz de Deus habite o seu coração.',
    'Que hoje seja um dia de bênçãos e vitórias em Deus.',
    'Confie o seu dia ao Senhor e siga em paz.',
    'Bom dia! Deus vai à frente preparando o seu caminho.',
    'Que a luz de Deus ilumine cada momento seu hoje.',
    'Comece o dia com fé e termine com gratidão.',
    'Bom dia! O Senhor cuida de você em cada detalhe.',
  ];
  static const _bomdiaB = [
    'Deus te abençoe! ☀️',
    'Bom dia com Deus.',
    'Vá em paz.',
    'Que Deus guie você.',
    'Um dia abençoado.',
    'Fé e força!',
    'Deus à frente.',
    'Que dê tudo certo.',
    'Bom dia, viva!',
    'Comece com Deus.',
    'Paz do Senhor.',
    'Amém!',
  ];

  // ---------------- BOA NOITE COM DEUS ----------------
  static const _boanoiteA = [
    'Boa noite! Descanse nos braços do Senhor.',
    'Entregue o seu sono ao cuidado de Deus.',
    'Que a paz do Senhor guarde a sua noite.',
    'Boa noite! Amanhã é uma nova graça de Deus.',
    'Feche o dia agradecendo ao Pai por tudo.',
    'Durma tranquilo: Deus vela pelo seu descanso.',
    'Boa noite! Que os anjos guardem o seu lar.',
    'Deixe as preocupações com Deus e descanse.',
    'Que Deus renove as suas forças enquanto você dorme.',
    'Boa noite! O amor do Senhor te cobre esta noite.',
    'Respire fundo e confie: Deus está no controle.',
    'Que a sua noite seja de paz e a manhã de vitórias.',
  ];
  static const _boanoiteB = [
    'Deus guarde o seu sono. 🌙',
    'Boa noite com Deus.',
    'Durma em paz.',
    'Descanse no Senhor.',
    'Que Deus te cubra.',
    'Paz e sossego.',
    'Até amanhã.',
    'Deus vela por você.',
    'Bons sonhos.',
    'Entregue a Deus.',
    'A paz do Senhor.',
    'Amém!',
  ];

  // ---------------- ORAÇÃO ----------------
  static const _oracaoA = [
    'Senhor, guia os meus passos e as minhas decisões.',
    'Deus, enche o meu coração da tua paz.',
    'Pai, cuida da minha família onde quer que esteja.',
    'Senhor, dá-me forças para vencer os desafios.',
    'Deus, aumenta a minha fé e a minha esperança.',
    'Pai, obrigado por cada bênção que recebo de ti.',
    'Senhor, abre os caminhos certos diante de mim.',
    'Deus, cura as minhas feridas por dentro e por fora.',
    'Pai, acalma a minha mente e a minha ansiedade.',
    'Senhor, faz de mim instrumento da tua paz.',
    'Deus, livra-me de todo mal e de todo perigo.',
    'Pai, que a tua vontade seja feita na minha vida.',
  ];
  static const _oracaoB = [
    'Em ti eu confio. Amém. 🙏',
    'Que assim seja. Amém.',
    'Nas tuas mãos. Amém.',
    'Bendito sejas. Amém.',
    'A ti a glória. Amém.',
    'No teu amor descanso. Amém.',
    'Guarda os meus passos. Amém.',
    'Creio em ti. Amém.',
    'Tudo entrego a ti. Amém.',
    'Que a tua luz me guie. Amém.',
    'Sê o meu refúgio. Amém.',
    'Amém!',
  ];

  // ---------------- PROTEÇÃO ----------------
  static const _protecaoA = [
    'O Senhor é o meu escudo e a minha fortaleza.',
    'Debaixo das asas de Deus eu encontro abrigo.',
    'Nenhum mal se aproximará de quem confia no Senhor.',
    'Deus vai à frente e me guarda por todos os lados.',
    'O Senhor é o meu refúgio nas horas difíceis.',
    'Estou seguro porque Deus cuida de mim.',
    'A proteção do Altíssimo cobre a minha vida.',
    'Com Deus, não temo o que o dia possa trazer.',
    'O Senhor guarda a minha entrada e a minha saída.',
    'Deus é a minha rocha e o meu lugar seguro.',
    'Nada me abala quando Deus está comigo.',
    'A mão do Senhor me sustenta e me protege.',
  ];
  static const _protecaoB = [
    'Deus é o meu escudo. 🛡️',
    'Estou seguro em Deus.',
    'O Senhor me guarda.',
    'Nada me abala.',
    'Deus me protege.',
    'Refúgio seguro.',
    'Sob as asas de Deus.',
    'Confio no Senhor.',
    'Deus vai à frente.',
    'Minha fortaleza.',
    'Guardado por Deus.',
    'Amém!',
  ];

  // ---------------- BÊNÇÃOS ----------------
  static const _bencaosA = [
    'Que as bênçãos do Senhor transbordem na sua vida.',
    'Deus tem um mar de bênçãos preparado para você.',
    'Receba hoje a bênção e o favor de Deus.',
    'As promessas de Deus são bênçãos a caminho.',
    'Que a graça do Senhor alcance a sua casa.',
    'Deus abençoa quem confia e persevera nele.',
    'Que o Senhor prospere o trabalho das suas mãos.',
    'Bênçãos sem medida para quem ama a Deus.',
    'A cada dia, novas bênçãos do céu se derramam.',
    'Que Deus abençoe você e a sua família.',
    'O favor de Deus está sobre a sua vida.',
    'Receba paz, saúde e prosperidade do Senhor.',
  ];
  static const _bencaosB = [
    'Seja abençoado! ✨',
    'Deus abençoe você.',
    'Bênçãos sem fim.',
    'O favor de Deus.',
    'Graça e paz.',
    'Deus proverá.',
    'Que Deus prospere você.',
    'Bênçãos a caminho.',
    'Receba do Senhor.',
    'Deus é generoso.',
    'Toda bênção vem de Deus.',
    'Amém!',
  ];

  // ---------------- PERSEVERANÇA ----------------
  static const _perseverancaA = [
    'Não desista: Deus está preparando a sua vitória.',
    'Perseverar na fé é confiar mesmo na demora.',
    'Depois da prova, vem a promessa cumprida.',
    'Deus honra quem persevera e não desanima.',
    'Continue firme: o Senhor está com você.',
    'A batalha é do Senhor, apenas confie e siga.',
    'Quem persevera até o fim alcança a coroa.',
    'Nos vales também Deus caminha ao nosso lado.',
    'Force um pouco mais: o milagre está próximo.',
    'A fé que persiste vê a mão de Deus agir.',
    'Deus transforma a espera em testemunho.',
    'Não solte a mão de Deus, ele não solta a sua.',
  ];
  static const _perseverancaB = [
    'Não desista! 💪',
    'Continue firme.',
    'Deus honra você.',
    'A vitória vem.',
    'Persevere na fé.',
    'Deus está com você.',
    'Force mais um pouco.',
    'Confie e siga.',
    'O milagre vem.',
    'Fé até o fim.',
    'Deus é fiel.',
    'Amém!',
  ];

  // ---------------- PAZ ----------------
  static const _pazA = [
    'A paz de Deus excede todo entendimento.',
    'Entregue as suas ansiedades e receba a paz do Senhor.',
    'Em Deus, o meu coração encontra descanso.',
    'A paz que o mundo não dá, Deus oferece de graça.',
    'Aquiete o coração: Deus está no controle.',
    'A presença de Deus traz calma em qualquer tempestade.',
    'Confie no Senhor e a paz habitará em você.',
    'Deus acalma o mar e acalma também a alma.',
    'Onde Deus reina, há paz e serenidade.',
    'Respire: a paz do Senhor está com você.',
    'Descanse em Deus e deixe a ansiedade partir.',
    'A paz de Cristo guarda o meu coração e a minha mente.',
  ];
  static const _pazB = [
    'A paz do Senhor. 🕊️',
    'Fique em paz.',
    'Descanse em Deus.',
    'Deus acalma tudo.',
    'Entregue a Deus.',
    'Serenidade em Cristo.',
    'Confie e aquiete-se.',
    'Paz que vem do céu.',
    'Deus está no controle.',
    'Respire e confie.',
    'Paz interior.',
    'Amém!',
  ];

  // ---------------- LOUVOR E ADORAÇÃO ----------------
  static const _louvorA = [
    'Toda honra e toda glória pertencem a Deus.',
    'Louvado seja o Senhor por tudo o que ele faz.',
    'Adorar a Deus é reconhecer a sua grandeza.',
    'Que a minha vida seja um louvor ao Senhor.',
    'Deus é digno de todo louvor e adoração.',
    'Levanto as minhas mãos e adoro ao Rei dos reis.',
    'No louvor eu encontro força e alegria.',
    'Cantarei ao Senhor enquanto eu tiver vida.',
    'Que o meu coração se alegre em adorar a Deus.',
    'A adoração aproxima o céu da nossa vida.',
    'Grande é o Senhor e digno de ser louvado.',
    'Aleluia! O Senhor reina para sempre.',
  ];
  static const _louvorB = [
    'Glória a Deus! 🎶',
    'Aleluia!',
    'Louvado seja o Senhor.',
    'Toda honra a Deus.',
    'Adore ao Rei.',
    'Deus é digno.',
    'Cante ao Senhor.',
    'Grande é o Senhor.',
    'Bendito seja Deus.',
    'Ao Senhor a glória.',
    'Adoração pura.',
    'Amém!',
  ];

  // ---------------- PALAVRA DO DIA ----------------
  static const _palavraA = [
    'A Palavra de Deus é luz para o nosso caminho.',
    'Guarde a Palavra do Senhor no seu coração.',
    'Na Palavra de Deus encontramos direção e vida.',
    'A voz de Deus fala mais alto que os problemas.',
    'Medite na Palavra e o seu dia será abençoado.',
    'A Palavra do Senhor consola, ensina e fortalece.',
    'Onde a Palavra de Deus entra, a vida se transforma.',
    'Beba da Palavra como quem bebe água viva.',
    'A promessa de Deus é firme e verdadeira.',
    'A Palavra do Senhor permanece para sempre.',
    'Alimente a sua fé com a Palavra de Deus.',
    'A Palavra é a espada que vence toda batalha.',
  ];
  static const _palavraB = [
    'A Palavra de Deus é viva. 📖',
    'Medite nela hoje.',
    'Luz para o caminho.',
    'Guarde no coração.',
    'A voz de Deus.',
    'Palavra que transforma.',
    'Fé vem pela Palavra.',
    'Deus fala com você.',
    'Vida e direção.',
    'Palavra eterna.',
    'Confie na promessa.',
    'Amém!',
  ];

  // ---------------- MENSAGENS EVANGÉLICAS (premium) ----------------
  static const _mensagensA = [
    'Que Deus abençoe você e encha a sua vida de paz.',
    'Envio a você uma mensagem de fé e esperança.',
    'Que o Senhor cuide de cada passo da sua caminhada.',
    'Deus tem coisas boas preparadas para a sua vida.',
    'Que a graça e a paz de Cristo estejam com você.',
    'Nunca se esqueça: você é precioso aos olhos de Deus.',
    'Que a presença do Senhor seja o seu maior tesouro.',
    'Deus enxuga cada lágrima e restaura cada sonho.',
    'Que a sua fé cresça e as suas bênçãos se multipliquem.',
    'O Senhor está mais perto do que você imagina.',
    'Confie: Deus escreve certo por linhas tortas.',
    'Que o amor de Deus alcance você onde você estiver.',
  ];
  static const _mensagensB = [
    'Fique na paz do Senhor. 💌',
    'Deus abençoe você.',
    'Com fé e carinho.',
    'Que Deus te guarde.',
    'Um abraço em Cristo.',
    'Deus cuida de você.',
    'Graça e paz.',
    'Confie no Senhor.',
    'Deus está com você.',
    'Bênçãos sem fim.',
    'Vá com Deus.',
    'Amém!',
  ];

  // ---------------- FÉ EM MILAGRES (premium) ----------------
  static const _milagresA = [
    'O mesmo Deus de ontem faz milagres hoje.',
    'Não duvide: o impossível é o quintal de Deus.',
    'Onde termina a nossa força, começa o poder de Deus.',
    'Deus faz o extraordinário na vida de quem crê.',
    'O milagre que você espera já está a caminho.',
    'Para Deus não existe causa perdida.',
    'A mão do Senhor pode mudar toda a sua história.',
    'Creia no impossível: com Deus tudo é possível.',
    'Deus abre portas que ninguém pode fechar.',
    'O Senhor transforma o deserto em jardim.',
    'Espere o inesperado: Deus está agindo.',
    'A fé no milagre começa antes de vê-lo acontecer.',
  ];
  static const _milagresB = [
    'Creia no milagre! 🌟',
    'Com Deus é possível.',
    'Deus faz o impossível.',
    'Espere o milagre.',
    'Nada é impossível.',
    'Deus vai agir.',
    'Confie no poder de Deus.',
    'O milagre vem.',
    'Deus muda tudo.',
    'Tenha fé.',
    'Deus é maravilhoso.',
    'Amém!',
  ];

  // ---------------- REFLEXÃO CRISTÃ (premium) ----------------
  static const _reflexaoA = [
    'A vida é um sopro; viva-a para a glória de Deus.',
    'O que edifica a alma vale mais que o que enche os olhos.',
    'Perdoar é libertar o próprio coração.',
    'A humildade é o caminho de quem quer se achegar a Deus.',
    'Servir ao próximo é servir ao Senhor.',
    'A verdadeira riqueza é ter a paz de Deus no coração.',
    'Deus valoriza o coração, não a aparência.',
    'Quem confia em Deus não caminha sozinho.',
    'A fé sem amor é como um sino sem som.',
    'O amor de Deus nos ensina a amar sem medida.',
    'Cada provação é uma oportunidade de crescer na fé.',
    'Deus não escolhe os capazes; ele capacita os escolhidos.',
  ];
  static const _reflexaoB = [
    'Reflita com Deus. 🌌',
    'Pense nisso hoje.',
    'Sabedoria do alto.',
    'Guarde no coração.',
    'Uma verdade eterna.',
    'Deus ensina assim.',
    'Cresça na fé.',
    'Medite nisso.',
    'Viva para Deus.',
    'A escolha é sua.',
    'Deus é bom.',
    'Amém!',
  ];

  static final List<VerseCategory> categories = [
    VerseCategory(id: 'fe', name: 'Fé', emoji: '🙏', gradient: _fe, verses: _mix(_feA, _feB)),
    VerseCategory(id: 'amordeus', name: 'Amor de Deus', emoji: '❤️', gradient: _amordeus, verses: _mix(_amordeusA, _amordeusB)),
    VerseCategory(id: 'gratidao', name: 'Gratidão a Deus', emoji: '🙌', gradient: _gratidao, verses: _mix(_gratidaoA, _gratidaoB)),
    VerseCategory(id: 'esperanca', name: 'Esperança', emoji: '🌅', gradient: _esperanca, verses: _mix(_esperancaA, _esperancaB)),
    VerseCategory(id: 'bomdia', name: 'Bom Dia com Deus', emoji: '☀️', gradient: _bomdia, verses: _mix(_bomdiaA, _bomdiaB)),
    VerseCategory(id: 'boanoite', name: 'Boa Noite com Deus', emoji: '🌙', gradient: _boanoite, verses: _mix(_boanoiteA, _boanoiteB)),
    VerseCategory(id: 'oracao', name: 'Oração', emoji: '🕊️', gradient: _oracao, verses: _mix(_oracaoA, _oracaoB)),
    VerseCategory(id: 'protecao', name: 'Proteção', emoji: '🛡️', gradient: _protecao, verses: _mix(_protecaoA, _protecaoB)),
    VerseCategory(id: 'bencaos', name: 'Bênçãos', emoji: '✨', gradient: _bencaos, verses: _mix(_bencaosA, _bencaosB)),
    VerseCategory(id: 'perseveranca', name: 'Perseverança', emoji: '💪', gradient: _perseveranca, verses: _mix(_perseverancaA, _perseverancaB)),
    VerseCategory(id: 'paz', name: 'Paz', emoji: '🤍', gradient: _paz, verses: _mix(_pazA, _pazB)),
    VerseCategory(id: 'louvor', name: 'Louvor e Adoração', emoji: '🎶', gradient: _louvor, verses: _mix(_louvorA, _louvorB)),
    VerseCategory(id: 'palavra', name: 'Palavra do Dia', emoji: '📖', gradient: _palavra, verses: _mix(_palavraA, _palavraB)),
    VerseCategory(id: 'mensagens', name: 'Mensagens Evangélicas', emoji: '💌', gradient: _mensagens, premium: true, verses: _mix(_mensagensA, _mensagensB)),
    VerseCategory(id: 'milagres', name: 'Fé em Milagres', emoji: '🌟', gradient: _milagres, premium: true, verses: _mix(_milagresA, _milagresB)),
    VerseCategory(id: 'reflexao', name: 'Reflexão Cristã', emoji: '🌌', gradient: _reflexao, premium: true, verses: _mix(_reflexaoA, _reflexaoB)),
  ];

  static List<Verse> get all => [for (final c in categories) ...c.verses];

  static List<Verse> get freeVerses =>
      [for (final c in categories) if (!c.premium) ...c.verses];

  static VerseCategory categoryById(String id) =>
      categories.firstWhere((c) => c.id == id, orElse: () => categories.first);
}
