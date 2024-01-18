import 'package:Taallam/config/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 3));
    navigateToHome();
  }

  navigateToHome() {
    Get.toNamed('/signin');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(
        color: AppColors.splashscreenColor,
        child: Center(
          child: Image.network(
            '${ApiVariables.imageConfig}/1701478479tallam.png',
            // You can customize the image loading behavior, such as width, height, and fit.
            width: 200.0,
            height: 200.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
