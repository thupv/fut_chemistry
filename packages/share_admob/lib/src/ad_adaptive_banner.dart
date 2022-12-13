// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:io' show Platform;
// import 'package:share_shimmer/share_shimmer.dart';
// import 'package:share_admob/share_admob.dart';

// // ignore: use_key_in_widget_constructors
// class AdAdaptiveBanner extends StatefulWidget {
//   const AdAdaptiveBanner({super.key, required this.adUnitId});

//   final String adUnitId;
//   @override
//   // ignore: library_private_types_in_public_api
//   _AdAdaptiveBannerState createState() => _AdAdaptiveBannerState();
// }

// class _AdAdaptiveBannerState extends State<AdAdaptiveBanner> {
//   AdManagerBannerAd? _adManagerBannerAd;
//   bool _adManagerBannerAdIsLoaded = false;

//   @override
//   Widget build(BuildContext context) {
//     final adManagerBannerAd = _adManagerBannerAd;
//     if (_adManagerBannerAdIsLoaded && adManagerBannerAd != null) {
//       return Container(
//         height: adManagerBannerAd.sizes[0].height.toDouble(),
//         width: adManagerBannerAd.sizes[0].width.toDouble(),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.green.withOpacity(0.5),
//           ),
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(22),
//             topRight: Radius.circular(8),
//             bottomLeft: Radius.circular(8),
//             bottomRight: Radius.circular(8),
//           ),
//         ),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             AdWidget(
//               ad: _adManagerBannerAd!,
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: IntrinsicHeight(
//                 child: Container(
//                   width: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.amber,
//                     border: Border.all(color: Colors.amber),
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(22),
//                       bottomRight: Radius.circular(22),
//                     ),
//                   ),
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.all(6),
//                   child: const Text(
//                     'Ad',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//     return AdAdaptiveShimmer();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _adManagerBannerAd = AdManagerBannerAd(
//       adUnitId: widget.adUnitId,
//       request: const AdManagerAdRequest(nonPersonalizedAds: true),
//       sizes: <AdSize>[AdSize.largeBanner],
//       listener: AdManagerBannerAdListener(
//         onAdLoaded: (Ad ad) {
//           setState(() {
//             _adManagerBannerAdIsLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           ad.dispose();
//         },
//         onAdOpened: (Ad ad) => print('$AdManagerBannerAd onAdOpened.'),
//         onAdClosed: (Ad ad) => print('$AdManagerBannerAd onAdClosed.'),
//       ),
//     )..load();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _adManagerBannerAd?.dispose();
//   }
// }
