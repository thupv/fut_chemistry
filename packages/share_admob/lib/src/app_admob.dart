import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppAdmob {
  static InterstitialAd? _interstitialAd;
  static RewardedInterstitialAd? _rewardedInterstitialAd;
  static RewardedAd? _rewardedAd;

  static int _numInterstitialLoadAttempts = 0;
  static int _numRewardedLoadAttempts = 0;
  static int _numRewardedInterstitialLoadAttempts = 0;
  static int maxFailedLoadAttempts = 3;

  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  static void dispose() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _rewardedInterstitialAd?.dispose();
  }

  static Future<void> createRewardedInterstitialAd({
    required String adUnitId,
  }) async {
    await RewardedInterstitialAd.load(
      adUnitId: adUnitId,
      request: request,
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (RewardedInterstitialAd ad) {
          _rewardedInterstitialAd = ad;
          _numRewardedInterstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _rewardedInterstitialAd = null;
          _numRewardedInterstitialLoadAttempts += 1;
          if (_numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
            createRewardedInterstitialAd(adUnitId: adUnitId);
          }
        },
      ),
    );
  }

  static Future<void> showRewardedInterstitialAd({
    required String adUnitId,
  }) async {
    if (_rewardedInterstitialAd == null) {
      return;
    }
    _rewardedInterstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) => {},
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
        ad.dispose();
        createRewardedInterstitialAd(adUnitId: adUnitId);
      },
      onAdFailedToShowFullScreenContent:
          (RewardedInterstitialAd ad, AdError error) {
        ad.dispose();
        createRewardedInterstitialAd(adUnitId: adUnitId);
      },
    );

    await _rewardedInterstitialAd!.setImmersiveMode(true);
    await _rewardedInterstitialAd!.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {},
    );
    _rewardedInterstitialAd = null;
  }

  static Future<void> createRewardedAd({required String adUnitId}) async {
    await RewardedAd.load(
      adUnitId: adUnitId,
      request: request,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          _numRewardedLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _rewardedAd = null;
          _numRewardedLoadAttempts += 1;
          if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
            createRewardedAd(adUnitId: adUnitId);
          }
        },
      ),
    );
  }

  static Future<void> showRewardedAd({required String adUnitId}) async {
    if (_rewardedAd == null) {
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad showRewardedAd.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        ad.dispose();
        createRewardedAd(adUnitId: adUnitId);
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
        createRewardedAd(adUnitId: adUnitId);
      },
    );

    await _rewardedAd!.setImmersiveMode(true);
    await _rewardedAd!
        .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
    _rewardedAd = null;
  }

  static Future<void> createInterstitialAd({required String adUnitId}) async {
    await InterstitialAd.load(
        adUnitId: adUnitId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              createInterstitialAd(adUnitId: adUnitId);
            }
          },
        ));
  }

  static Future<void> showInterstitialAd({required String adUnitId}) async {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad showInterstitialAd.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd(adUnitId: adUnitId);
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterstitialAd(adUnitId: adUnitId);
      },
    );
    await _interstitialAd!.show();
    _interstitialAd = null;
  }
}
