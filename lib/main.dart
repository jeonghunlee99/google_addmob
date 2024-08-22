import 'package:flutter/material.dart';
import 'admob_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AdMobHelper adMobHelper = AdMobHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(adMobHelper: adMobHelper),
    );
  }
}

class FirstPage extends StatelessWidget {
  final AdMobHelper adMobHelper;

  FirstPage({required this.adMobHelper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('첫번째 페이지'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            adMobHelper.loadBannerAd();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(adMobHelper: adMobHelper),
              ),
            );
          },
          child: Text('다음페이지'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final AdMobHelper adMobHelper;

  SecondPage({required this.adMobHelper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('광고 배너'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            adMobHelper.getBannerAdWidget(),
          ],
        ),
      ),
    );
  }
}
