import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobManager {
  static RewardedInterstitialAd? _rewardedAd;
  static int _numRewardedLoadAttempts = 0;
  static int maxFailedLoadAttempts = 3;
  static const testInterstitialAdsId = 'ca-app-pub-3940256099942544/5354046379';
  static const interstitialAdsIOSId = 'ca-app-pub-9472343620180321/9982789505';

  static init() {
    MobileAds.instance.initialize();
  }

  static loadRewardAd() {
    RewardedInterstitialAd.load(
        adUnitId: interstitialAdsIOSId,
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;

          },
          onAdFailedToLoad: (LoadAdError error) {
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            print('Load ads failed: $_numRewardedLoadAttempts $error');
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              loadRewardAd();
            }
          },
        )
    );
  }

  static Future<void> showRewardedAd() async {
    print(_rewardedAd);
    if (_rewardedAd == null) {
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
          print('ad showRewardedAd.'),
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
        ad.dispose();
        loadRewardAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedInterstitialAd ad, AdError error) {
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