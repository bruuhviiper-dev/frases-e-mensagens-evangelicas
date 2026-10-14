import 'dart:math';

import 'package:flutter/material.dart';

import 'models.dart';

/// Banco de FRASES E MENSAGENS EVANGÉLICAS (offline). Conteúdo 100% ORIGINAL,
/// devocional e respeitoso — NÃO reproduz traduções protegidas da Bíblia.
///
/// Cada categoria combina dois conjuntos de trechos (ideia × arremate) via
/// produto cartesiano, gerando 300+ mensagens ÚNICAS por categoria — todas
/// editáveis no app.
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

  /// Produto cartesiano REAL: cada abertura (a) combina com cada fecho (b).
  static List<Verse> _mix(List<String> a, List<String> b) {
    final seen = <String>{};
    final out = <Verse>[];
    for (final x in a) {
      for (final y in b) {
        final t = '$x $y';
        if (seen.add(t)) out.add(Verse(t));
      }
    }
    // Embaralha (semente fixa = ordem estável) p/ não listar várias frases com
    // a MESMA abertura em sequência — fica mais variado na tela.
    out.shuffle(Random(7));
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
    'A fé é o combustível que nos move para o alto.',
    'Quem crê não desiste, apenas espera no Senhor.',
    'A tua fé pode ser pequena, mas o teu Deus é imenso.',
    'Ande pela fé, e não somente pelo que você vê.',
    'A cada amanhecer, renove a sua fé em Deus.',
    'Confiar é descansar sabendo que Deus cuida de tudo.',
    'A fé enxerga a saída antes mesmo de ela aparecer.',
    'Firme na fé, nenhum vento te derruba.',
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
    'Siga crendo.',
    'A vitória vem.',
    'Deus é maior.',
    'Confia e descansa.',
    'Amém!',
  ];

  // ---------------- AMOR DE DEUS ----------------
  static const _amordeusA = [
    'O amor de Deus é maior que qualquer falha nossa.',
    'Você é amado por Deus exatamente como é.',
    'Nada pode nos separar do amor de Deus.',
    'O amor do Senhor se renova a cada manhã.',
    'Deus te ama com um amor que não tem fim.',
    'No amor de Deus encontramos nosso lugar de descanso.',
    'O amor de Deus cura o que o mundo quebrou.',
    'Deus te escolheu e te ama desde sempre.',
    'O amor do Pai é refúgio nos dias de tempestade.',
    'Mesmo quando erramos, o amor de Deus permanece.',
    'O amor de Deus é paciente, fiel e eterno.',
    'Você vale muito aos olhos daquele que te criou.',
    'O amor de Deus não depende do nosso merecimento.',
    'Deus te sustenta com cordas de puro amor.',
    'No colo do Pai, o coração encontra abrigo.',
    'O amor de Deus transborda e alcança você hoje.',
    'Deus cuida de você com ternura de Pai.',
    'O amor do Senhor é o maior presente da vida.',
    'Deus te ama tanto que nunca solta a sua mão.',
    'O amor de Deus é o abraço que acalma a alma.',
  ];
  static const _amordeusB = [
    'Deus te ama. ❤️',
    'Você é amado.',
    'Amor eterno.',
    'O Pai te abraça.',
    'Amor que não falha.',
    'Deus cuida de você.',
    'Você é precioso.',
    'No amor do Pai.',
    'Amor sem fim.',
    'Deus está perto.',
    'Descanse nele.',
    'Você importa.',
    'Amado por Deus.',
    'O Pai te espera.',
    'Coração seguro.',
    'Amém!',
  ];

  // ---------------- GRATIDÃO A DEUS ----------------
  static const _gratidaoA = [
    'Obrigado, Senhor, por mais um dia de vida.',
    'Gratidão transforma o pouco em suficiente.',
    'Agradeço a Deus por tudo o que ele já fez.',
    'Toda honra e toda glória pertencem ao Senhor.',
    'Meu coração é grato pelas bênçãos de cada dia.',
    'Grato por cada livramento que nem percebi.',
    'A gratidão abre as portas para novas bênçãos.',
    'Obrigado, Deus, pela vida, pela fé e pela família.',
    'Ser grato é reconhecer a mão de Deus em tudo.',
    'Agradeço pelas vitórias e também pelos aprendizados.',
    'Com um coração grato, enxergo o cuidado de Deus.',
    'Obrigado, Senhor, por nunca me desamparar.',
    'A gratidão é a melhor oração que posso oferecer.',
    'Grato por Deus escrever a minha história com amor.',
    'Reconheço: tudo o que tenho vem das mãos de Deus.',
    'Gratidão pelo ar que respiro e pelo amor que recebo.',
    'Agradeço a Deus até pelo que ainda está por vir.',
    'Meu louvor nasce de um coração cheio de gratidão.',
    'Obrigado, Senhor, por transformar o meu choro em alegria.',
    'A cada bênção recebida, o meu "obrigado" se multiplica.',
  ];
  static const _gratidaoB = [
    'Obrigado, Senhor! 🙌',
    'Gratidão sempre.',
    'Deus é bom.',
    'Grato por tudo.',
    'A ele a glória.',
    'Bênçãos sem fim.',
    'Deus proverá.',
    'Coração grato.',
    'Toda honra a Deus.',
    'Deus é fiel.',
    'Gratidão a Deus.',
    'Que alegria!',
    'Louvado seja.',
    'Deus merece.',
    'Grato demais.',
    'Amém!',
  ];

  // ---------------- ESPERANÇA ----------------
  static const _esperancaA = [
    'Depois da noite escura, Deus traz o amanhecer.',
    'A esperança no Senhor nunca decepciona.',
    'Dias melhores estão sendo preparados por Deus.',
    'Não desista: Deus ainda não terminou a sua história.',
    'Há esperança porque Deus está no comando.',
    'O melhor de Deus para você ainda está por vir.',
    'Enquanto há fé, há esperança de recomeçar.',
    'Deus transforma o deserto em fonte de água viva.',
    'A promessa de Deus é maior que a sua espera.',
    'Levante a cabeça: o socorro vem do Senhor.',
    'A esperança é a âncora da alma em Deus.',
    'Confie: Deus está abrindo um novo caminho.',
    'O que parece fim, para Deus é um novo começo.',
    'Renove a esperança, pois Deus renova as forças.',
    'Nada está perdido quando Deus está no controle.',
    'A tua primavera vem depois do inverno, confie.',
    'Espere no Senhor e o impossível acontece.',
    'Deus tem planos de paz e de futuro para você.',
    'A esperança em Deus acende a luz no fim do túnel.',
    'Mantenha o coração firme: o melhor está chegando.',
  ];
  static const _esperancaB = [
    'Espere no Senhor. 🌅',
    'Dias melhores virão.',
    'Deus tem um plano.',
    'Não desista.',
    'A promessa é certa.',
    'Haja o que houver.',
    'O amanhã é de Deus.',
    'Renove as forças.',
    'Confie e espere.',
    'Deus vai agir.',
    'Levante a cabeça.',
    'A luz vem.',
    'Fé e esperança.',
    'Deus restaura.',
    'Siga em frente.',
    'Amém!',
  ];

  // ---------------- BOM DIA COM DEUS ----------------
  static const _bomdiaA = [
    'Bom dia! Que Deus abençoe o seu caminho hoje.',
    'Comece o dia entregando tudo nas mãos de Deus.',
    'Que a paz do Senhor guie o seu dia.',
    'Hoje é um novo presente de Deus para você.',
    'Desperte com gratidão: Deus te deu mais um dia.',
    'Que a graça de Deus ilumine a sua manhã.',
    'Bom dia! Deus já foi na frente preparar o seu caminho.',
    'Que hoje o Senhor encha você de fé e alegria.',
    'Comece bem: com oração e confiança em Deus.',
    'Que cada passo de hoje seja guiado pelo Senhor.',
    'Deus te acordou com um propósito hoje, confie.',
    'Que a misericórdia de Deus renove a sua manhã.',
    'Bom dia! Que Deus transforme o seu dia em bênção.',
    'Levante e brilhe: a luz de Deus está com você.',
    'Que a presença do Senhor seja o seu bom dia.',
    'Entregue a Deus a sua manhã e viva em paz.',
    'Que hoje seja um dia de vitórias ao lado de Deus.',
    'Bom dia! O amor de Deus já está sobre você.',
    'Respire fundo: Deus cuida de cada detalhe do seu dia.',
    'Que o Senhor abra portas boas para você hoje.',
  ];
  static const _bomdiaB = [
    'Bom dia com Deus! ☀️',
    'Deus abençoe o seu dia.',
    'Tenha um ótimo dia.',
    'Deus vai na frente.',
    'Um dia de bênçãos.',
    'Comece com fé.',
    'Que seu dia brilhe.',
    'Deus cuida de tudo.',
    'Paz e alegria.',
    'Vá com Deus.',
    'Dia abençoado.',
    'Deus é bom.',
    'Confie e vá.',
    'Sorria, Deus te ama.',
    'Bom dia, família!',
    'Amém!',
  ];

  // ---------------- BOA NOITE COM DEUS ----------------
  static const _boanoiteA = [
    'Boa noite! Descanse nos braços do Senhor.',
    'Entregue o seu dia a Deus e durma em paz.',
    'Que o Senhor guarde o seu sono e os seus sonhos.',
    'Encerre o dia com gratidão no coração.',
    'Boa noite! Deus vela por você enquanto você dorme.',
    'Descanse: amanhã Deus renova as suas forças.',
    'Que a paz de Deus acalme o seu coração esta noite.',
    'Durma tranquilo, pois Deus está no controle.',
    'Boa noite! O amor de Deus cobre você como um manto.',
    'Deixe as preocupações com Deus e descanse.',
    'Que anjos do Senhor guardem o seu lar esta noite.',
    'Feche os olhos sabendo que Deus cuida de tudo.',
    'Boa noite! Que Deus transforme o cansaço em descanso.',
    'Dorme em paz: o Senhor não dorme para te guardar.',
    'Que a noite traga calma e a manhã traga bênçãos.',
    'Entregue os seus medos a Deus antes de dormir.',
    'Boa noite! Que a presença de Deus encha o seu quarto.',
    'Descanse o corpo e a alma no cuidado do Senhor.',
    'Que o seu sono seja abençoado pelo Pai do céu.',
    'Boa noite! Amanhã é mais um dia de graça com Deus.',
  ];
  static const _boanoiteB = [
    'Boa noite com Deus! 🌙',
    'Durma em paz.',
    'Deus te guarda.',
    'Descanse no Senhor.',
    'Bons sonhos.',
    'Deus vela por você.',
    'Paz no coração.',
    'Até amanhã, se Deus quiser.',
    'Noite abençoada.',
    'Entregue a Deus.',
    'Deus cuida de você.',
    'Descanse tranquilo.',
    'Boa noite, família!',
    'Deus é bom.',
    'Durma com fé.',
    'Amém!',
  ];

  // ---------------- ORAÇÃO ----------------
  static const _oracaoA = [
    'Senhor, coloco a minha vida inteira nas tuas mãos.',
    'A oração é a chave que abre o coração de Deus.',
    'Orar é conversar com quem nunca nos abandona.',
    'Senhor, me dá forças para enfrentar este dia.',
    'Na oração encontro paz para a minha alma.',
    'Deus, guia os meus passos e ilumina o meu caminho.',
    'Orar transforma a ansiedade em confiança.',
    'Senhor, cuida da minha família e do meu lar.',
    'Eu oro e entrego a Deus o que não posso controlar.',
    'Que a minha oração suba como incenso ao Senhor.',
    'Deus, renova a minha fé e cura o meu coração.',
    'Na presença de Deus, toda oração encontra resposta.',
    'Senhor, faça em mim segundo a tua vontade.',
    'Oro por paz, por saúde e por sabedoria do alto.',
    'Antes de agir, eu me ajoelho e converso com Deus.',
    'Senhor, obrigado por ouvir cada palavra da minha oração.',
    'A oração sincera move o coração de Deus.',
    'Deus, me ensina a confiar mais e a temer menos.',
    'Que a minha vida seja uma oração constante a ti.',
    'Senhor, nas tuas mãos deposito todos os meus dias.',
  ];
  static const _oracaoB = [
    'Amém. 🕊️',
    'Em nome de Jesus.',
    'Senhor, te entrego.',
    'Ouve a minha oração.',
    'Confio em ti.',
    'Seja feita a tua vontade.',
    'Deus está ouvindo.',
    'Orando sempre.',
    'Nas tuas mãos.',
    'Guia-me, Senhor.',
    'Paz no coração.',
    'Deus responde.',
    'Oro por você.',
    'A ti, Senhor.',
    'Fé e oração.',
    'Amém!',
  ];

  // ---------------- PROTEÇÃO ----------------
  static const _protecaoA = [
    'O Senhor é o meu refúgio e a minha fortaleza.',
    'Debaixo das asas de Deus eu encontro abrigo.',
    'Nenhum mal se aproxima de quem Deus protege.',
    'Deus é o escudo que me guarda de todo perigo.',
    'Onde Deus guarda, o inimigo não entra.',
    'O Senhor vai à minha frente e cobre a minha retaguarda.',
    'Estou seguro, pois Deus é a minha proteção.',
    'Deus envia os seus anjos para cuidar de mim.',
    'Nas mãos do Senhor, estou firme e protegido.',
    'A proteção de Deus me acompanha aonde eu for.',
    'O Senhor é a muralha que me cerca de amor.',
    'Com Deus por perto, não temo o que possa vir.',
    'Deus guarda a minha entrada e a minha saída.',
    'A sombra do Altíssimo é o meu lugar seguro.',
    'Deus é o meu socorro bem presente na angústia.',
    'Sob o cuidado de Deus, o meu lar está protegido.',
    'O Senhor cobre a minha família com a sua paz.',
    'Nada me abala, pois Deus é a minha rocha.',
    'A proteção do Senhor é maior que qualquer ameaça.',
    'Deus é o meu abrigo em todo tempo de tempestade.',
  ];
  static const _protecaoB = [
    'Deus me protege. 🛡️',
    'Estou seguro nele.',
    'O Senhor me guarda.',
    'Nada temerei.',
    'Deus é meu refúgio.',
    'Firme na rocha.',
    'Deus cobre você.',
    'Protegido pelo Pai.',
    'Deus é meu escudo.',
    'Sem medo.',
    'Deus está comigo.',
    'Abrigo seguro.',
    'O Senhor vai na frente.',
    'Confio e descanso.',
    'Deus guarda o lar.',
    'Amém!',
  ];

  // ---------------- BÊNÇÃOS ----------------
  static const _bencaosA = [
    'Que Deus derrame bênçãos sem medida sobre você.',
    'As bênçãos do Senhor enriquecem e trazem paz.',
    'Que a graça de Deus te alcance hoje e sempre.',
    'Deus prepara bênçãos onde você menos espera.',
    'Que a sua vida transborde das bênçãos do Céu.',
    'O favor de Deus está sobre a sua vida.',
    'Que o Senhor abençoe os seus planos e sonhos.',
    'As bênçãos de Deus chegam no tempo certo.',
    'Receba hoje uma chuva de bênçãos do Senhor.',
    'Que Deus abençoe o seu trabalho e o seu lar.',
    'A bênção de Deus não traz tristeza junto.',
    'Que o Senhor multiplique tudo o que é seu.',
    'Deus abençoa quem confia e espera nele.',
    'Que portas de bênçãos se abram para você.',
    'A mão de Deus está estendida para te abençoar.',
    'Que a paz e a provisão de Deus te acompanhem.',
    'Deus tem bênçãos preparadas com o seu nome.',
    'Que a sua família seja cercada de bênçãos.',
    'O Senhor te abençoe e te guarde em todo tempo.',
    'Que cada dia seu seja marcado pela bênção de Deus.',
  ];
  static const _bencaosB = [
    'Seja abençoado! ✨',
    'Bênçãos sem fim.',
    'Deus te abençoe.',
    'O favor vem.',
    'Graça e paz.',
    'Deus provê.',
    'Dias de bênção.',
    'Receba a bênção.',
    'Deus é generoso.',
    'Tudo no tempo dele.',
    'Vida abençoada.',
    'Deus multiplica.',
    'Portas abertas.',
    'Deus é bom.',
    'Que venha a bênção.',
    'Amém!',
  ];

  // ---------------- PERSEVERANÇA ----------------
  static const _perseverancaA = [
    'Não desista: a vitória pertence a quem persevera.',
    'Deus fortalece quem decide continuar.',
    'Cada passo de fé te aproxima da promessa.',
    'A provação passa, mas a fé permanece firme.',
    'Quem persevera no Senhor colhe no tempo certo.',
    'Levanta, sacode a poeira e confia em Deus.',
    'A perseverança é a fé que se recusa a parar.',
    'Deus sustenta você quando as forças faltam.',
    'Continue: o Senhor termina o que começou em você.',
    'A luta é grande, mas o seu Deus é maior.',
    'Persistir na fé é confiar que Deus não falha.',
    'Depois da batalha vem a coroa da vitória.',
    'Não meça esforços: Deus honra quem insiste.',
    'A paciência e a fé constroem grandes vitórias.',
    'Firme no propósito, nenhum obstáculo te detém.',
    'Deus renova as forças de quem espera nele.',
    'Siga em frente: o deserto também tem saída.',
    'A perseverança transforma sonhos em testemunhos.',
    'Resista mais um pouco: a resposta está chegando.',
    'Com Deus você não desiste, você recomeça.',
  ];
  static const _perseverancaB = [
    'Não desista! 💪',
    'Vá até o fim.',
    'Deus te sustenta.',
    'A vitória vem.',
    'Persevere na fé.',
    'Continue firme.',
    'Deus honra você.',
    'Siga em frente.',
    'Força e fé.',
    'Não pare agora.',
    'Deus está contigo.',
    'Resista mais um pouco.',
    'A coroa te espera.',
    'Confie no processo.',
    'Levante e vá.',
    'Amém!',
  ];

  // ---------------- PAZ ----------------
  static const _pazA = [
    'A paz de Deus acalma o que a mente não entende.',
    'Onde Deus habita, a paz também mora.',
    'No meio da tempestade, a paz do Senhor permanece.',
    'Entregue a Deus a sua ansiedade e receba a paz.',
    'A paz de Cristo é o descanso do coração.',
    'Deus é a calmaria no meio das minhas lutas.',
    'Com Deus no coração, a alma encontra sossego.',
    'A paz que vem de Deus nenhum problema tira.',
    'Respire: a paz do Senhor está com você.',
    'Deus troca a minha agonia pela sua paz.',
    'A verdadeira paz nasce da confiança em Deus.',
    'Que a paz de Deus guarde o seu coração e a sua mente.',
    'No silêncio da oração eu encontro a paz.',
    'Deus acalma as tempestades e também o meu interior.',
    'A paz do Senhor é maior que qualquer circunstância.',
    'Confie em Deus e a paz tomará o lugar do medo.',
    'A presença de Deus traz paz onde havia caos.',
    'Deus é o meu porto seguro e a minha paz.',
    'Descanse: a paz de Deus está cuidando de você.',
    'Que a serenidade do Senhor encha os seus dias.',
  ];
  static const _pazB = [
    'Paz no coração. 🤍',
    'Deus é a minha paz.',
    'Descanse nele.',
    'Fique na paz.',
    'Sem ansiedade.',
    'Deus acalma.',
    'Tudo ficará bem.',
    'Respire e confie.',
    'A paz vem de Deus.',
    'Calma e fé.',
    'Deus cuida de tudo.',
    'Sossego na alma.',
    'Confie e descanse.',
    'Paz que excede.',
    'Deus está perto.',
    'Amém!',
  ];

  // ---------------- LOUVOR E ADORAÇÃO ----------------
  static const _louvorA = [
    'Toda a minha alma louva ao Senhor.',
    'Adorar a Deus é reconhecer quem ele é.',
    'Que o meu louvor alcance os céus hoje.',
    'Deus é digno de todo louvor e honra.',
    'Levanto as minhas mãos para adorar o Senhor.',
    'No louvor eu encontro liberdade e alegria.',
    'Canto a Deus porque ele é bom o tempo todo.',
    'Que a minha vida seja um louvor ao Criador.',
    'Adoro a Deus pelo que ele é, não só pelo que faz.',
    'O louvor abre portas e quebra correntes.',
    'Com gratidão e alegria eu exalto o Senhor.',
    'Deus habita no meio do louvor do seu povo.',
    'Que o meu coração transborde em adoração.',
    'Louvar a Deus é a melhor resposta à sua bondade.',
    'Toda honra, toda glória e todo louvor a ti, Senhor.',
    'No louvor, a tristeza vira dança e alegria.',
    'Adorar é colocar Deus acima de tudo.',
    'Que cada respiro meu seja um louvor ao Senhor.',
    'Deus merece o meu melhor louvor hoje.',
    'Exalto o nome do Senhor sobre todas as coisas.',
  ];
  static const _louvorB = [
    'Aleluia! 🎶',
    'Glória a Deus.',
    'Louvado seja o Senhor.',
    'Toda honra a ele.',
    'Exalta a Deus.',
    'Digno é o Senhor.',
    'Adora ao Rei.',
    'Que alegria louvar.',
    'A ele a glória.',
    'Louvor e adoração.',
    'Deus é digno.',
    'Cante a Deus.',
    'Levante as mãos.',
    'Deus é bom.',
    'Glória nas alturas.',
    'Amém!',
  ];

  // ---------------- PALAVRA DO DIA ----------------
  static const _palavraA = [
    'A palavra de Deus é lâmpada para os meus pés.',
    'Guarde no coração o que Deus fala hoje.',
    'A palavra do Senhor sustenta e renova a fé.',
    'Hoje Deus tem uma palavra de amor para você.',
    'Na palavra de Deus encontro direção e paz.',
    'Deixe a palavra do Senhor guiar as suas escolhas.',
    'A palavra de Deus permanece para sempre.',
    'Medite na palavra e a sua alma será fortalecida.',
    'Deus fala ao coração de quem se dispõe a ouvir.',
    'A palavra do Senhor transforma vidas por dentro.',
    'Cada palavra de Deus é um tesouro para a vida.',
    'A verdade da palavra de Deus liberta e cura.',
    'Comece o dia ouvindo o que Deus tem a dizer.',
    'A palavra do Senhor é alimento para a alma.',
    'Deixe a palavra habitar ricamente em você.',
    'Na palavra de Deus está a sabedoria do alto.',
    'A palavra de Deus nunca volta vazia.',
    'Hoje a palavra do Senhor renova a sua esperança.',
    'Semeie a palavra de Deus e colha bons frutos.',
    'A palavra do Senhor é firme como uma rocha.',
  ];
  static const _palavraB = [
    'Palavra viva. 📖',
    'Guarde no coração.',
    'Deus está falando.',
    'Medite nisso.',
    'Palavra eterna.',
    'Confie na promessa.',
    'Sabedoria do alto.',
    'Deus direciona.',
    'Alimente a fé.',
    'A verdade liberta.',
    'Reflita hoje.',
    'Deus é fiel.',
    'Leia e creia.',
    'Luz no caminho.',
    'Palavra de vida.',
    'Amém!',
  ];

  // ---------------- MENSAGENS EVANGÉLICAS ----------------
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
    'Deus transforma o seu deserto em terra de bênçãos.',
    'Que este dia seja cheio da bondade do Senhor.',
    'Lembre-se: com Deus você nunca está sozinho.',
    'Que a esperança em Deus renove o seu coração.',
    'Deus te vê, te ouve e cuida de cada detalhe seu.',
    'Que a luz de Cristo brilhe em todos os seus caminhos.',
    'O Senhor te sustenta com a sua mão poderosa.',
    'Que a paz de Deus guarde você e toda a sua família.',
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
    'Deus te ama.',
    'Fé e esperança.',
    'O Senhor te guia.',
    'Paz e bem.',
    'Amém!',
  ];

  // ---------------- FÉ EM MILAGRES ----------------
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
    'Deus faz o impossível virar testemunho.',
    'O teu milagre pode estar na próxima oração.',
    'Nada é grande demais para o poder de Deus.',
    'Deus especializou-se em transformar o impossível.',
    'Creia: o Senhor ainda vai te surpreender.',
    'O milagre nasce onde a fé não desiste.',
    'Deus move o céu e a terra por quem confia nele.',
    'O impossível é apenas o lugar onde Deus começa.',
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
    'O impossível se curva.',
    'Deus surpreende.',
    'Creia e verás.',
    'A vitória é certa.',
    'Amém!',
  ];

  // ---------------- REFLEXÃO CRISTÃ ----------------
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
    'O perdão é o presente que você dá a si mesmo.',
    'A gratidão enxerga bênçãos onde outros veem problemas.',
    'Semeie o bem: a colheita pertence a Deus.',
    'Quem anda com Deus aprende a esperar com paz.',
    'A maior sabedoria é confiar quando não se entende.',
    'O caráter se constrói no silêncio das escolhas.',
    'Amar como Deus ama é o maior dos milagres.',
    'A vida ganha sentido quando é vivida para Deus.',
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
    'Semeie o bem.',
    'Confie sempre.',
    'Paz e sabedoria.',
    'Deus te molda.',
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
    VerseCategory(id: 'mensagens', name: 'Mensagens Evangélicas', emoji: '💌', gradient: _mensagens, verses: _mix(_mensagensA, _mensagensB)),
    VerseCategory(id: 'milagres', name: 'Fé em Milagres', emoji: '🌟', gradient: _milagres, verses: _mix(_milagresA, _milagresB)),
    VerseCategory(id: 'reflexao', name: 'Reflexão Cristã', emoji: '🌌', gradient: _reflexao, verses: _mix(_reflexaoA, _reflexaoB)),
  ];

  static List<Verse> get all => [for (final c in categories) ...c.verses];

  static List<Verse> get freeVerses =>
      [for (final c in categories) if (!c.premium) ...c.verses];

  static VerseCategory categoryById(String id) =>
      categories.firstWhere((c) => c.id == id, orElse: () => categories.first);
}
