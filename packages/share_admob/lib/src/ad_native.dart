// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:io' show Platform;

// import 'package:share_shimmer/share_shimmer.dart';

// // ignore: public_member_api_docs
// class AdNative extends StatefulWidget {
//   const AdNative({
//     super.key,
//     required this.adUnitId,
//   });

//   final String adUnitId;
//   @override
//   // ignore: library_private_types_in_public_api
//   _AdNativeState createState() => _AdNativeState();
// }

// class _AdNativeState extends State<AdNative> {
//   NativeAd? _nativeAd;

//   @override
//   Widget build(BuildContext context) {
//     if (_nativeAd != null) {
//       return Container(
//         width: 250,
//         height: 350,
//         child: AdWidget(
//           ad: _nativeAd!,
//         ),
//       );
//     } else {
//       return const AdAdaptiveShimmer();
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // COMPLETE: Load a native ad
//     NativeAd(
//       adUnitId: widget.adUnitId,
//       factoryId: 'listTile',
//       request: const AdRequest(),
//       listener: NativeAdListener(
//         onAdLoaded: (ad) {
//           setState(() {
//             _nativeAd = ad as NativeAd;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {
//           ad.dispose();
//         },
//       ),
//     ).load();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _nativeAd?.dispose();
//   }
// }
