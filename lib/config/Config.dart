import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//You can change App colors  from here
class AppColors {
  //lightttttttttttt
  static final Color bg = const Color(0xFFF0F0F0);
  static final Color containerColor = Color.fromARGB(255, 223, 216, 205);
  static final Color splashscreenColor = const Color(0xFFFFFFFF);
  static final Color Icon1Color = const Color(0xFF004a84);
  static final Color Icon2Color = const Color(0xFFFFFFFF);
  static final Color Icon3Color = const Color(0xFF999999);
  static final Color mainfontColor = const Color(0xFF000000);
  static final Color secoundfontColor = const Color(0xFF004a84);
  static final Color smalltextfontColor = const Color(0xFF999999);
  static final Color textColor = const Color(0xFF999999);
  static final Color BBarColor = const Color(0xFFE5C3A6);

//darkkkkkkkkkkk

  static final Color DfontColor = const Color(0xFFFFFFFF);
  static final Color Dbg = const Color(0xFF213555);
  static final Color DcontainerColor = const Color(0xFF4f709c);
  static final Color DIconColor = const Color(0xFFE5C3A6);
  static final Color DBarColor = const Color(0xFF4f709c);
}

class LogoImage {
  static final Image logoImage = Image.asset(
    'assets/img/appicon.png',
    width: 100.w,
    height: 100.h,
  );
}

class AppIcon {
  static final Image logoImage = Image.asset(
    'assets/img/appicon.png',
  );
}

class ApiVariables {
  static const String BASE_URL = 'https://taallam-platform.com';
  static const String VideoConfig = '$BASE_URL/uploads';
  static const String imageConfig = '$BASE_URL/uploads';

  static const String Home = '$BASE_URL/home';
  static const String course_lesson_api = '$Home/get_course_lesson_api/';
  static const String GET_ALL_CATEGORIES = '$Home/featured_categories_api';
  static const String category_courses = '$Home/get_category_courses_api/';
  static const String featured_courses_api = '$Home/featured_courses_api';
  static const String search = '$Home/search_api?keyword=برمجة';
  static const String recent = '$Home/recent_courses_api';
  static const String usersignin = '$Home/user_login_api';
  static const String slider = '$Home/get_slider_api';
  static const String usercourses = '$Home/get_my_courses_api';
}
