import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsService {
  static Future<void> init() async {
    await MobileAds.instance.initialize();
  }

  static BannerAd createBanner() => BannerAd(
    size: AdSize.banner,
    adUnitId: BannerAd.testAdUnitId, // replace with real ID before release
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );
}
