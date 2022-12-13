import 'dart:io' show Platform;

class AdManager {
  static final interstitialAds_1 = Platform.isAndroid
      ? testInterstitialAdsId
      : interstitialAdsIOSId;
  static const testInterstitialAdsId = 'ca-app-pub-3940256099942544/5354046379';
  static const interstitialAdsIOSId = 'ca-app-pub-6038936385902534/8676361556';
}
