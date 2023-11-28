import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//You can change App colors  from here
class AppColors{
  static final Color containerColor = const Color(0xFFFFFFFF);
  static final Color splashscreenColor = const Color(0xFFFFFFFF);
  static final Color Icon1Color = const Color(0xFF004a84);
  static final Color Icon2Color = const Color(0xFFFFFFFF);
  static final Color Icon3Color = const Color(0xFF999999);
  static final Color mainfontColor=const Color(0xFF000000);
  static final Color secoundfontColor=const Color(0xFF004a84);
  static final Color smalltextfontColor=const Color(0xFF999999);
  static final Color textColor=const Color(0xFF999999);


}
//You can change the logo from here
class LogoImage{
  static final Image logoImage= Image.asset('assets/img/OSUSlogo.png',width: 100.w,height: 100.h,);
}


class AppIcon{
  static final Image logoImage= Image.asset('assets/img/appicon.png',);
}
class ApiVariables {
  static const String BASE_URL = 'https://osus.academy';
  static const String Home = '$BASE_URL/home';
  static const String category_courses = '$Home/get_category_courses_api/';
  static const String UserSIGNIN = '$Home/user_login_api';
  static const String course_lesson_api = '$Home/get_course_lesson_api/';
  static const String GET_ALL_CATEGORIES = '$Home/featured_categories_api';
  static const String featured_courses_api = '$Home/featured_courses_api';
}