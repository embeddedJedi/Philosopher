import 'dart:math';

import 'package:filazof/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String philosopherQuote;

  List<String> philosopherQuotes = [
    "Bir insan ne düşündüğüyle değil, neyi düşündüğüyle özgürdür. - Epiktetos",
    "Bilgili kişi, bilgisiz kişinin çiftine katlanır. Aptal kişi, herkesin yarısıdır. - Konfüçyüs",
    "Akıl, insanı yücelten en güçlü ve en kutsal şeydir. - Herakleitos",
    "Var olmanın anlamı, birini aydınlatmaktır. - Tolstoy",
    "Kendi doğrularımızı yaratmak yerine, başkalarının yanlışlarını sürdürmeyi seçeriz. - La Rochefoucauld",
    "Bilgi sahibi olmadan fikir yürütmek tehlikelidir. - Konfüçyüs",
    "Gerçek huzur, bilgiye ve erdeme dayanır. - Demokritos",
    "Bilgi güçtür. - Francis Bacon",
    "Düşünmek, yaşamakla aynı şeydir. - Marcus Aurelius",
    "Gerçek bilgi, kendinizi bilmektir. - Socrates",
  ];

  @override
  void initState() {
    super.initState();

    // Rastgele bir filozof sözü seçme
    philosopherQuote =
        philosopherQuotes[Random().nextInt(philosopherQuotes.length)];

    // 3 saniye sonra yönlendirme
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitSquareCircle(
                color: Colors.deepPurple,
                size: 50.0,
              ),
              SizedBox(height: 45),
              Text(
                philosopherQuote,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
