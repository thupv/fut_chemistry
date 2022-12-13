// // ignore_for_file: public_member_api_docs

// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:share_admob/src/ad_manager.dart';

// mixin AdRewardInterstitialMixin<T extends StatefulWidget> on State<T> {
//   RewardedInterstitialAd? _rewardedInterstitialAd;
//   int _numRewardedInterstitialLoadAttempts = 0;
//   int maxFailedLoadAttempts = 3;

//   AdRequest request = AdRequest(
//     keywords: <String>['foo', 'bar'],
//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );

//   @override
//   void dispose() {
//     _rewardedInterstitialAd?.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     createRewardedInterstitialAd();
//   }

//   Future<void> createRewardedInterstitialAd() async {
//     await RewardedInterstitialAd.load(
//       adUnitId: AdManager.interstitialAds_1,
//       request: request,
//       rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
//         onAdLoaded: (RewardedInterstitialAd ad) {
//           _rewardedInterstitialAd = ad;
//           _numRewardedInterstitialLoadAttempts = 0;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           _rewardedInterstitialAd = null;
//           _numRewardedInterstitialLoadAttempts += 1;
//           if (_numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
//             createRewardedInterstitialAd();
//           }
//         },
//       ),
//     );
//   }

//   Future<void> showRewardedInterstitialAd() async {
//     if (_rewardedInterstitialAd == null) {
//       return;
//     }
//     _rewardedInterstitialAd!.fullScreenContentCallback =
//         FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedInterstitialAd ad) => {},
//       onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
//         ad.dispose();
//         createRewardedInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent:
//           (RewardedInterstitialAd ad, AdError error) {
//         ad.dispose();
//         createRewardedInterstitialAd();
//       },
//     );

//     await _rewardedInterstitialAd!.setImmersiveMode(true);
//     await _rewardedInterstitialAd!
//         .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
//     _rewardedInterstitialAd = null;
//   }
// }
