import 'dart:io' show Platform;

class AdManager {
  static final interstitialAds_1 = Platform.isAndroid
      ? testInterstitialAdsId
      : testInterstitialAdsId;
  static const testInterstitialAdsId = 'ca-app-pub-3940256099942544/5354046379';
}
