import 'package:Osus/config/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    Navigator.pushReplacementNamed(context, '/SigninPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       color: AppColors.splashscreenColor,
        child: Center(child: Image.asset("assets/img/OSUSlogo.png")),
      ),
    );
  }
}
