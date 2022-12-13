// // ignore_for_file: require_trailing_commas, public_member_api_docs

// import 'package:flutter/cupertino.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:share_admob/src/ad_manager.dart';

// mixin AdInterstitialMixin<T extends StatefulWidget> on State<T> {
//   InterstitialAd? _interstitialAd;
//   int _numInterstitialLoadAttempts = 0;
//   int maxFailedLoadAttempts = 3;

//   static const AdRequest request = AdRequest(
//     keywords: <String>['foo', 'bar'],
//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );

//   @override
//   void dispose() {
//     _interstitialAd?.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     createInterstitialAd();
//     print('createInterstitialAd');
//   }

//   Future<void> createInterstitialAd() async {
//     await InterstitialAd.load(
//         adUnitId: AdManager.interstitialAds_2,
//         request: request,
//         adLoadCallback: InterstitialAdLoadCallback(
//           onAdLoaded: (InterstitialAd ad) {
//             _interstitialAd = ad;
//             _numInterstitialLoadAttempts = 0;
//             _interstitialAd!.setImmersiveMode(true);
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             _numInterstitialLoadAttempts += 1;
//             _interstitialAd = null;
//             if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
//               createInterstitialAd();
//             }
//           },
//         ));
//   }

//   Future<void> showInterstitialAd() async {
//     if (_interstitialAd == null) {
//       return;
//     }
//     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (InterstitialAd ad) => {},
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         ad.dispose();
//         createInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         ad.dispose();
//         createInterstitialAd();
//       },
//     );
//     await _interstitialAd!.show();
//     _interstitialAd = null;
//   }
// }
