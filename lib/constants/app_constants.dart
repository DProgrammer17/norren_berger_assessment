import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConstants {
  static const size = _SizeConstant();

  static const designWidth = 375.0;
  static const designHeight = 812.0;

  static const pageIndex = 0;
  static const pageSize = 10;

  static double get deviceWidth {
    return ScreenUtil().screenWidth;
  }

  static double get deviceHeight {
    return ScreenUtil().screenHeight;
  }
}

class _SizeConstant {
  const _SizeConstant();
  static const double _storyBarRadius = 22;
  static const double _toolBarHeight = 45;
  static const double _tileBorderRadius = 12;
  static const double _lowerBoarderRadius = 8;

  double get storyBarRadius => _storyBarRadius.ar;
  double get toolBarHeight => _toolBarHeight.ah;
  double get tileBorderRadius => _tileBorderRadius.ar;
  double get lowerBoarderRadius => _lowerBoarderRadius.ar;
}

extension SizeExtension on num {
  double get aw => w;
  double get ah => h;
  double get ar => r;
  double get asp => sp;
}
