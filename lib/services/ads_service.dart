import 'package:flutter/foundation.dart';

class AdsService {
  AdsService._();
  static final AdsService instance = AdsService._();

  static const String bannerAdUnitId = 'ca-app-pub-9529770421530115/9324310886';
  static const String bannerViewType = 'malama_banner_ad';

  Future<void> init() async {
    debugPrint('AdsService: stub init (no plugin)');
  }
}