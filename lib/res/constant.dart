import 'package:flutter/foundation.dart';

class Constant {

  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = kReleaseMode;

  //引导页
  static const String keyGuide = 'keyGuide';
  static const String locale = 'locale';
  static const String theme = 'AppTheme';
}
