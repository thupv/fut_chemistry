import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobManager {
  static RewardedAd? _rewardedAd;
  static int _numRewardedLoadAttempts = 0;
  static int maxFailedLoadAttempts = 3;
  static const testInterstitialAdsId = 'ca-app-pub-3940256099942544/5354046379';
  static const interstitialAdsIOSId = '';

  static init() {
    MobileAds.instance.initialize();
  }

  static loadRewardAd() {
    RewardedAd.load(
        adUnitId: interstitialAdsIOSId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;

          },
          onAdFailedToLoad: (LoadAdError error) {
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              loadRewardAd();
            }
          },
        )
    );
  }

  static Future<void> showRewardedAd() async {
    if (_rewardedAd == null) {
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad showRewardedAd.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        ad.dispose();
        loadRewardAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
        loadRewardAd();
      },
    );

    await _rewardedAd!.setImmersiveMode(true);
    await _rewardedAd!
        .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
    _rewardedAd = null;
  }
}