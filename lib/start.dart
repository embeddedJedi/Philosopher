import 'package:filazof/filazof.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: ModernAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/goodman.png'),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(230, 60),
              ),
              child: Text(
                'Oyuna Başla',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HowToPlayScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(230, 60),
              ),
              child: Text(
                'Nasıl Oynanır?',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModernAppBar extends AppBar {
  ModernAppBar()
      : super(
          title: Text(
            'Kim Filozof Olmak İster',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class HowToPlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nasıl Oynanır?'),
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oyunun Amacı',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kim Filozof Olmak İster oyununun amacı, doğru cevapları yanıtlayarak mümkün olduğunca yüksek bir skor elde etmektir. Sorular ilerledikçe zorluk seviyesi artar. Oyun, felsefe alanındaki bilginizi test etmek ve eğlenmek için tasarlanmış interaktif bir oyundur. Oyun, çeşitli felsefi konuları kapsayan sorularla doludur ve size ne kadar iyi bir filozof olduğunuzu gösterir.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Oyun Kuralları',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '- Oyuna başladığınızda size bir dizi soru sorulacaktır. Her soru için dört seçenek bulunmaktadır (A, B, C, D).',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '- Doğru cevabı seçtiğinizde puan kazanırsınız. Yanlış cevap verdiğinizde oyun sona erer ve skorunuz gösterilir.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '- 50/50 jokerini kullanarak yanlış cevapların 2 tanesini silin.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '- Telefon jokeriyle bir arkadaşınızı arayarak cevaplara %70 ihtimalle doğru cevap alabilirsiniz.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "+ O zaman en iyi skorları yapmaya çalışalım ve filozof kimmiş gösterelim!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Uygulamayı Yapan: Emirhan Ekşi \nİyi Oyunlar Dileriz...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
