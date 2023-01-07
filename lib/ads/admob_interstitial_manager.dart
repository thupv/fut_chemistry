import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdmobInterstitialManager {
  static InterstitialAd? _videoAd;
  static int _numRewardedLoadAttempts = 0;
  static int maxFailedLoadAttempts = 3;
  static const testInterstitialAdsId = 'ca-app-pub-3940256099942544/1033173712';
  static const interstitialAdsIOSId = 'ca-app-pub-9472343620180321/2578397036';
  static const interstitialAdsAndroidId =
      'ca-app-pub-9472343620180321/9634759978';

  static loadVideoAd() {
    InterstitialAd.load(
        // adUnitId: testInterstitialAdsId,
      adUnitId: Platform.isAndroid
          ? interstitialAdsAndroidId
          : interstitialAdsIOSId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _videoAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            _videoAd = null;
            _numRewardedLoadAttempts += 1;
            print('Load ads failed: $_numRewardedLoadAttempts $error');
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              loadVideoAd();
            }
          },
        ));
  }

  static Future<void> showAd() async {
    if (_videoAd == null) {
      return;
    }
    _videoAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad video Ad.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadVideoAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        loadVideoAd();
      },
    );

    await _videoAd!.setImmersiveMode(true);
    await _videoAd!.show();
    _videoAd = null;
  }
}
