import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdmobBannerManager {
  static ValueNotifier<BannerAd?> anchoredAdaptiveAd = ValueNotifier(null);
  static ValueNotifier<bool> isLoaded = ValueNotifier(false);
  static const testBannerAdsId = 'ca-app-pub-3940256099942544/6300978111';
  static const bannerAdsIosId = 'ca-app-pub-9472343620180321/7798934123';
  static const bannerAdsAndroidId = 'ca-app-pub-9472343620180321/8572959749';

  static loadBannerAd(BuildContext context) async {
    await anchoredAdaptiveAd.value?.dispose();
    anchoredAdaptiveAd.value = null;
    isLoaded.value = false;
    final AnchoredAdaptiveBannerAdSize? size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());
    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    anchoredAdaptiveAd.value = BannerAd(
      // adUnitId: testBannerAdsId,
      adUnitId: Platform.isAndroid
          ? bannerAdsAndroidId
          : bannerAdsIosId,
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          isLoaded.value = true;
          print('$ad loaded: ${ad.responseInfo}');
          anchoredAdaptiveAd.value = ad as BannerAd;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return anchoredAdaptiveAd.value!.load();
  }

  static getWidget(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isLoaded,
        builder: (context, bool isLoaded, child) {
          if(isLoaded == false) {
            return Container();
          }
          return Container(
            color: Colors.green,
            width: anchoredAdaptiveAd.value!.size.width.toDouble(),
            height: anchoredAdaptiveAd.value!.size.height.toDouble(),
            child: AdWidget(ad: anchoredAdaptiveAd.value!),
          );
        }
    );
  }

  static dispose() {
    anchoredAdaptiveAd.value?.dispose();
    anchoredAdaptiveAd.value = null;
    isLoaded.value = false;
  }
}
