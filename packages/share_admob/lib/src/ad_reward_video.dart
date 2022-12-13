// // ignore_for_file: public_member_api_docs

// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// mixin AdRewardVideoMixin<T extends StatefulWidget> on State<T> {
//   RewardedAd? _rewardedAd;
//   int _numRewardedLoadAttempts = 0;
//   int maxFailedLoadAttempts = 3;

//   AdRequest AdVideoRequest = const AdRequest(
//     keywords: <String>['foo', 'bar'],
//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );

//   @override
//   void dispose() {
//     _rewardedAd?.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     print('AdRewardVideoMixin');
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     print('createRewardedAd');
//   }

//   Future<void> createRewardedAd({required String adUnitId}) async {
//     await RewardedAd.load(
//       adUnitId: adUnitId,
//       request: AdVideoRequest,
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           _rewardedAd = ad;
//           _numRewardedLoadAttempts = 0;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           _rewardedAd = null;
//           _numRewardedLoadAttempts += 1;
//           if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
//             createRewardedAd();
//           }
//         },
//       ),
//     );
//   }

//   Future<void> showRewardedAd() async {
//     if (_rewardedAd == null) {
//       return;
//     }
//     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd adVideo) {
//         /// onAdShowedFullScreenContent
//       },
//       onAdDismissedFullScreenContent: (RewardedAd adVideo) {
//         adVideo.dispose();
//         createRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd adVideo, AdError error) {
//         adVideo.dispose();
//         createRewardedAd();
//       },
//     );

//     await _rewardedAd!.setImmersiveMode(true);
//     await _rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView adVideo, RewardItem reward) {});
//     _rewardedAd = null;
//   }
// }
