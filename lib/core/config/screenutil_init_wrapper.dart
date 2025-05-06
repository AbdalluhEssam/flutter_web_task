
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilInitWrapper extends StatelessWidget {
  final Widget child;
  const ScreenUtilInitWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: getDesignSize(context),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => child,
    );
  }

  Size getDesignSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1000) {
      return const Size(1440, 1024);
    } else if (width >= 700) {
      return const Size(768, 1024);
    } else {
      return const Size(375, 875);
    }
  }
}
