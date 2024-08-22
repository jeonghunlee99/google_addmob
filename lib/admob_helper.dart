import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobHelper {
  late BannerAd _bannerAd;

  AdMobHelper() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/9214589741',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          print('Ad loaded successfully.');
        },
        onAdFailedToLoad: (ad, error) {
          print('Ad failed to load: $error');
        },
      ),
    );
  }

  Future<void> loadBannerAd() async {
    try {
      await _bannerAd.load();
      print('Ad loading...');
    } catch (e) {
      print('Failed to load ad: $e');
    }
  }

  Widget getBannerAdWidget() {
    return Container(
      height: 50,
      child: AdWidget(ad: _bannerAd),
    );
  }

  void dispose() {
    _bannerAd.dispose();
  }
}
