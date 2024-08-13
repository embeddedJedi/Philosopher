import 'dart:math';

import 'package:filazof/start.dart';
import 'package:flutter/material.dart';

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int questionIndex = 0;
  int score = 0;
  bool fiftyFiftyUsed = false;
  bool phoneUsed = false;
  bool fiftyFiftyAvailable = true; // 50/50 jokeri kullanılabilir mi?
  bool phoneAvailable = true; // Telefon jokeri kullanılabilir mi?

  List<Question> questions = [
    Question(
      text:
          "İnsan tasarısından başka bir şey değildir. O ancak kendini gerçekleştirdiği ölçüde var olur. O halde insan eylemlerinin bütününden, hayatının kendisinden başka bir şey değildir. \n \n Metinde yer alan görüş aşağıdakilerden hangisidir? ",
      options: [
        "Yeni ontoloji ",
        "Egzistansiyalizm ",
        "Fenomenoloji ",
        "Düalizm "
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Aşağıdakilerden hangisi varlık felsefesinin sorularından biri değildir?",
      options: [
        "Varlık var mıdır? ",
        "Varlığın mahiyeti nedir? ",
        "Varlık ne türdendir?",
        "Varlığın bilgisi elde edilebilir mi?"
      ],
      correctIndex: 3,
    ),
    Question(
      text:
          "Varlığın, zihnin bir ürünü olduğunu ve insan bilincinden \n Bağımsız bir gerçekliğe sahip olamayacağını ileri sürenler, susuz kaldıklarında su ihtiyaçlarını düşünceleriyle doyurmalıdırlar.\n \n Bu sözlerde eleştirilen görüş aşağıdakilerden hangisidir? ",
      options: [
        "Varlık hem düşünce hem de maddeden oluşmuştur. ",
        "Varoluş özden önce gelir. ",
        "Varlıkta fenomenlerin bilinmesi mümkündür. ",
        "Varlık düşünceden ibarettir.",
      ],
      correctIndex: 3,
    ),
    Question(
      text:
          "Varlık ne türdendir?” sorusuna düşünürler akıl, fikir, düşünce olarak cevap vermektedirler. \n\n Buna göre, düşünürlerin cevapları aşağıdaki kavramların hangisine karşılık gelmektedir?  ",
      options: [
        "İdea",
        "Reel",
        "Oluş",
        "Fenomen",
      ],
      correctIndex: 0,
    ),
    Question(
      text:
          "Bir yargı ya da önerme gerçeklikle uyuşuyorsa ya da ifade ettiği bilgi, gerçekliğe denk düşüyorsa o bilgi doğrudur.\n Bu açıklama aşağıdaki sorulardan hangisine cevap Niteliğindedir?  ",
      options: [
        "Doğru bilgi mümkün müdür? ",
        "Doğru bilginin ölçütü nedir? ",
        "Bilgilerimizin kaynağı nedir? ",
        "Doğru bilginin sınırları var mıdır? ",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Evreni ve insanı açıklamaya çalışan dinin kaynağında Tanrı  İnancı vardır. Bu inanç dinde sezgi, vahiy ya da kutsal kitap Aracılığıyla temellendirilir. Dinde eleştiriye, temel iddiaların Doğruluğundan kuşku duymaya hiçbir şekilde yer yoktur.\n\n Bu parçada vurgulanan dinî bilginin özelliği aşağıdakilerden hangisidir? ",
      options: [
        "Evrensel mesajlar vermesi",
        "Toplumsal yaşamı şekillendirmesi",
        "Şüphesiz iman ve inancı gerektirmesi",
        "Ahlaki ögeler içermesi",
      ],
      correctIndex: 2,
    ),
    Question(
      text:
          " “Suje ile obje arasında kurulan bağdan doğan üründür.” \n\n Verilen tanım aşağıdaki kavramlardan hangisine aittir? ",
      options: [
        "Analoji ",
        "Bilgi ",
        "Doğruluk ",
        "Gerçeklik",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Her şeyi olduğu gibi kabul eden, merak etmeyen, kendisine sunulanla yetinen bir insan için, felsefe gerekli değildir. \n Bu açıklamada felsefi düşüncenin aşağıdaki özelliklerinden hangisi vurgulanmıştır? ",
      options: [
        "Subjektif olma ",
        "Akla ve mantığa dayanan bir düşünce olma  ",
        "Çözümleyici ve kurucu bir düşünce olma ",
        "Eleştirici ve sorgulayıcı olma ",
      ],
      correctIndex: 3,
    ),
    Question(
      text: "Aşağıdakilerden hangisi bilimsel bilginin bir özelliğidir? ",
      options: [
        "Sıradan günlük tecrübelerimize dayalı bir bilgidir. ",
        "Hayal gücüne dayalı bir bilgidir. ",
        "Gözlem, deney ve ölçmeye dayalı bir bilgidir. ",
        "Akla ve tefekküre dayalı bir bilgidir. ",
      ],
      correctIndex: 2,
    ),
    //
    Question(
      text:
          "Kepler, Galileo ve Huygens’in çalışmalarından yararlanan Newton, ortaya koyduğu yer çekimi yasası ile fizik Yasalarını evrensel hâle getirmiştir. \n \n Bu açıklama bilimsel bilginin aşağıdaki özelliklerinden hangisi ile ilgilidir? ",
      options: [
        "Birikimli ilerlemesi  ",
        "Objektif olması ",
        "Kesin olması",
        "Sistemli olması ",
      ],
      correctIndex: 0,
    ),
    Question(
      text:
          "Bilim insanı olanı inceler, olması gereken üzerine bir söylem geliştirmez. \n \n Bu bilgiden hareketle aşağıdakilerden hangisine ulaşılabilir? ",
      options: [
        "Bilim varlığa bütüncül yaklaşmaz. ",
        "Bilim birikimli olarak ilerler. ",
        "Bilim insanı nesneldir. ",
        "Bilim rasyonel bir etkinliktir. ",
      ],
      correctIndex: 2,
    ),
    //
    Question(
      text:
          "Üniversite sınavına girecek olan Aslı, doğaüstü bir gücün Sınavda başarılı olup olamayacağını önceden belirlediğini düşünmektedir. “Kaderimde ne yazıldıysa o olur. Çalışmama gerek yok.” Der, Aslı’nın bu savunması aşağıdaki görüşlerden hangisine uygundur? ",
      options: [
        "Otodeterminizm  ",
        "Fatalizm  ",
        "Determinizm ",
        "Liberteryanizm ",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          " Aşağıdakilerden hangisi “Ahlaki olan, yararlı olandır.”Görüşü ile temellendirilen ahlak anlayışıdır? ",
      options: [
        "Hedonizm",
        "Nihilizm   ",
        "Egoizm",
        "Pragmatizm",
      ],
      correctIndex: 3,
    ),
    Question(
      text:
          "Ahlak felsefesinin “toplum tarafından benimsenen ve kabul edilen davranışlar ile toplumun onaylamadığı ve yadsıdığı davranışlar” olarak tanımladığı kavramlar aşağıdakilerden hangisinde doğru olarak verilmiştir? ",
      options: [
        "Sevap – Günah ",
        "Güzel – Yanlış ",
        "İyi – Kötü ",
        "Güzel – Çirkin ",
      ],
      correctIndex: 2,
    ),
    Question(
      text:
          "Aşağıdakilerden hangisi dinin felsefeden temel farkını ifade eden kavramdır? ",
      options: [
        "Dogmatiklik ",
        "Tutarlılık  ",
        "Tarafsızlık ",
        "Akılsallık  ",
      ],
      correctIndex: 0,
    ),
    Question(
      text:
          " Her şeyin yaratıcısının eşi ve benzeri yoktur. Evrende var Olan her şey onun yaratması sonucu ve kontrolü altında Gerçekleşir. Yeryüzünün ve insanlığın kaderini yaratıcı Belirler. \n Bu açıklama aşağıdaki görüşlerden hangisine aittir? ",
      options: [
        "Deizm ",
        "Agnostisizm ",
        "Panteizm ",
        "Teizm ",
      ],
      correctIndex: 3,
    ),
    Question(
      text:
          "• Tanrı evrenin yaratıcısıdır. \n • Tanrı evreni yarattıktan sonra olup bitenlere müdahale etmemektedir. \n \n Verilen ifadeler aşağıdaki görüşlerden hangisine aittir? ",
      options: [
        "Panteizm  ",
        "Deizm  ",
        "Teizm ",
        "Politeizm  ",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Aristoteles'e göre her varlıkta iki unsur bulunmaktadır: ilki o varlığın şekli ve özelliği, diğeri ise bütün bunları kabul eden maddedir. Aristoteles görünüşlerin ve değişimlerin ardında birliği olan şeyin ne olduğu sorununu gerçeklik kavramı ile çözmeye çalışır. Ona göre, görünüşler (fenomenler) dünyasındaki her şey gerçeklik kazanmış olabilirliktir. \n\n Aristoteles varlığın meydana gelmesinde aşağıdakilerden hangisini savunur?",
      options: [
        "Madde- form bağlantısını",
        "idealar dünyasını",
        "Mutlak tin kavramını ",
        "Varlığın sadece maddesel olduğunu",
      ],
      correctIndex: 0,
    ),
    Question(
      text:
          "Platon'a göre, gerçeklik dünyasını oluşturan kavramlar alemindeki her şeyin bir kopyası vardır. Bu kopyalardan dünyada var olanları algılayabiliriz. Platon'a göre, var olanlar gerçekliğe nasıl yansır?",
      options: [
        "Kavramlar aleminin yanılsamaları olarak",
        "İdealar dünyasından aldıkları yansımalarla",
        "Doğrudan gözlem yaparak",
        "Deneyimlerimizle",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Sokrates, bilginin tek kaynağının içsel düşünce olduğuna inanıyordu. Buna göre, gerçeği keşfetmek için hangi yöntemleri kullanırdı?",
      options: [
        "Gözlem ve deneyim",
        "Mantıksal çıkarımlar ve sezgi",
        "Sadece deneysel yöntemler",
        "Rüyalar ve tahminler",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Empedokles'e göre, her şey dört temel unsurdan oluşur: hava, su, ateş ve toprak. Bu dört unsurun birleşiminden doğan fenomenleri nasıl açıklar?",
      options: [
        "Rastgele etkileşimler olarak",
        "Tanrısal müdahalelerle",
        "Doğal yasalara göre",
        "Rüyalar ve tahminler",
      ],
      correctIndex: 2,
    ),
    Question(
      text:
          "Aristoteles, insanın doğası gereği sosyal bir varlık olduğunu savunmuştur. Ona göre, insanın en yüksek amacı nedir?",
      options: [
        "Hedonizm",
        "Eudaimonia (mutluluk)",
        "Maddi zenginlik",
        "Kişisel çıkar",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Descartes'ın düşüncesine göre, insanın felsefi araştırmaları hangi temel ilkeye dayanır?",
      options: [
        "Doğa yasalarına",
        "Akıl ve mantığa",
        "Ruh ve bedenin ayrılabilirliğine",
        "Tanrı varlığına",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Kant'ın 'Aydınlanma Nedir?' adlı makalesinde, aydınlanmayı nasıl tanımlar?",
      options: [
        "Doğal fenomenlerin açıklanabilirliği",
        "Yaratıcı bir ruhun varlığı",
        "Dini inançların kabulü",
        "Akıl kullanımı ve özgürlük",
      ],
      correctIndex: 3,
    ),
    Question(
      text:
          "Friedrich Nietzsche'nin 'İnsan Doğası Üzerine' adlı eserinde, insanın doğasını nasıl betimler?",
      options: [
        "Sürekli bir iyileşme süreci olarak",
        "Hakimiyet ve kontrol arayışı",
        "Değişkenlik ve çelişki içinde",
        "Mutlak bir gerçeklik arayışı",
      ],
      correctIndex: 2,
    ),
    Question(
      text:
          "John Locke, insanın doğuştan sahip olduğu bilgileri reddeder. Ona göre, insan zihni nasıl bir boş sayfa gibidir?",
      options: [
        "Sadece deneysel gözlemlerle dolu",
        "Duyular yoluyla deneyimlerle doldurulur",
        "Evrensel ahlaki prensiplerle donatılmıştır",
        "Doğuştan gelen sezgilerle doludur",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Epikuros, mutluluğun en yüksek iyi olduğunu savunmuştur. Ona göre, mutluluğa ulaşmanın en etkili yolu nedir?",
      options: [
        "Hedonizm",
        "Sosyal statü",
        "Bilgi birikimi",
        "Dini ritüeller",
      ],
      correctIndex: 0,
    ),
    Question(
      text:
          "Karl Marx, insanın doğası gereği toplumsal bir varlık olduğunu savunmuştur. Ona göre, insanlar arasındaki temel ayrım nedir?",
      options: [
        "Maddi varlıklar",
        "Sınıf farkları",
        "Etnik kökenler",
        "Dini inançlar",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Descartes'ın 'Düşünüyorum, öyleyse varım' ifadesi ile neyi vurgulamak istediği hakkında kısa bir açıklama yapınız.",
      options: [
        "Bilginin sadece duyusal deneyimlere dayanmadığını",
        "Zihinsel varlığın maddenin ötesinde olduğunu",
        "Bilginin sadece doğrudan gözlem yoluyla elde edilebileceğini",
        "Zihinsel deneyimin var olmayan bir şeyi düşünemeyeceğini",
      ],
      correctIndex: 1,
    ),
    Question(
      text:
          "Epistemoloji ve ontoloji arasındaki temel fark nedir ve her biri neyi incelemektedir?",
      options: [
        "Epistemoloji, bilgiyi incelerken, ontoloji varlığı inceler.",
        "Epistemoloji varlığı incelerken, ontoloji bilgiyi inceler.",
        "Epistemoloji duyguları incelerken, ontoloji düşünceleri inceler.",
        "Epistemoloji insanları incelerken, ontoloji toplumları inceler.",
      ],
      correctIndex: 0,
    ),
  ];

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[questionIndex].correctIndex) {
      setState(() {
        score++;
        if (questionIndex < questions.length - 1) {
          questionIndex++;
          fiftyFiftyUsed = false;
          phoneUsed = false;
        } else {
          _showResultDialog();
        }
      });
    } else {
      _showResultDialog();
    }
  }

  void useFiftyFifty() {
    if (fiftyFiftyAvailable && !fiftyFiftyUsed) {
      setState(() {
        fiftyFiftyAvailable = false; // Joker artık kullanılamaz durumda
        fiftyFiftyUsed = true;

        List<String> allOptions = List.from(questions[questionIndex].options);
        int correctIndex = questions[questionIndex].correctIndex;

        List<String> remainingOptions = [];
        for (int i = 0; i < allOptions.length; i++) {
          if (i == correctIndex || allOptions[i] == '') {
            continue;
          }
          remainingOptions.add(allOptions[i]);
        }

        // Rastgele iki yanlış cevabı sil
        remainingOptions.shuffle();
        remainingOptions = remainingOptions.sublist(1, 2);

        // Seçenekleri güncelle
        for (int i = 0; i < allOptions.length; i++) {
          if (i != correctIndex) {
            if (remainingOptions.contains(allOptions[i])) {
              questions[questionIndex].options[i] = allOptions[i];
            } else {
              questions[questionIndex].options[i] = '';
            }
          }
        }
      });
    }
  }

  void usePhone() {
    if (phoneAvailable && !phoneUsed) {
      setState(() {
        phoneAvailable = false; // Joker artık kullanılamaz durumda
        phoneUsed = true;

        bool isCorrectAnswer = Random().nextDouble() <= 0.7;
        String answer = isCorrectAnswer
            ? questions[questionIndex]
                .options[questions[questionIndex].correctIndex]
            : questions[questionIndex].options[Random().nextInt(4)];

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Telefon Jokeri"),
              content: Text("Cevap: $answer"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Tamam"),
                ),
              ],
            );
          },
        );
      });
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Oyun Bitti"),
          content: Text("Tebrikler! Puanınız: $score"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  score = 0;
                  questionIndex = 0;
                  fiftyFiftyUsed = false;
                  phoneUsed = false;
                });
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new IntroductionScreen()));
              },
              child: Text("Yeniden Başla"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildScoreMessage() {
    String message = '';

    // Skor 5'e ulaştığında
    if (score >= 5 && score < 15) {
      message = 'İyi gidiyorsunuz! Devam edin.';
    }
    // Skor 15'e ulaştığında
    else if (score >= 15 && score < 30) {
      message = 'Harika! Bu gidişle filozof olmaya çok yakınsınız.';
    }
    // Skor 30'a ulaştığında
    else if (score >= 30) {
      message = 'Mükemmel! Siz bir filozofsunuz.';
    }

    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Soruları rastgele sırala
    questions.shuffle();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text('Kim Filozof Olmak İster?'),
          backgroundColor: Colors.indigoAccent,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Column(
                    children: [
                      Text(
                        questions[questionIndex].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: List.generate(4, (index) {
                          return OptionButton(
                            text:
                                "${String.fromCharCode(65 + index)}) ${questions[questionIndex].options[index]}",
                            onPressed: () {
                              checkAnswer(index);
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    JokerButton(
                      text: '50/50',
                      onPressed: fiftyFiftyUsed ? null : useFiftyFifty,
                      icon: Icons.shuffle,
                    ),
                    JokerButton(
                      text: 'Telefon',
                      onPressed: phoneUsed ? null : usePhone,
                      icon: Icons.phone,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Soru numarası ve skor tablosu
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Soru ${questionIndex + 1}/${questions.length}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Filozof Puanı: $score',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Skor mesajı
                if (score >= 5) _buildScoreMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  OptionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors
                .indigoAccent, // Buton rengini buradan değiştirebilirsiniz
          ),
        ),
      ),
    );
  }
}

class JokerButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  JokerButton({required this.text, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        primary: Colors.indigoAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
