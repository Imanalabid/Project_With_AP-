
import 'package:flutter/cupertino.dart';

import '../Auth/Sign_in.dart';
import '../Auth/Sign_up.dart';
import '../screens/Course/CoursePage.dart';
import '../screens/home/CategoryCoursespage.dart';
import '../screens/home/FeaturedCourses/FeaturedCoursesPage.dart';
import '../screens/home/home_page.dart';
import '../screens/home/homescreen.dart';
import '../screens/home/popularcoursespage.dart';
import '../screens/home/splash_Screen.dart';
import '../screens/profile/profile.dart';
import '../screens/profile/userinfo.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String signinPage = '/SigninPage';
  static const String homepage = '/homepage';
  static const String featuredCourses = '/FeaturedCourses';
  static const String popularCourses = '/PopularCourses';
  static const String profile = '/profile';
  static const String userinfo = '/userinfo';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String coursePage = '/CoursePage';
  static const String pcourses = '/PCourses';
  static const String secondScreen = '/SecondScreen';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    home: (context) => HomeScreen(),
    signinPage: (context) => SigninPage(),
    homepage: (context) => HomePage(),
    featuredCourses: (context) => FCourses(fcategory: []),
    popularCourses: (context) => PCourses(),
    profile: (context) => Profile(),
    userinfo: (context) => UserInfo(),
    signin: (context) => SigninPage(),
    signup: (context) => SignupPage(),
    coursePage: (context) => CoursePage(),
    pcourses: (context) => PCourses(),
    secondScreen: (context) => SecondScreen(categoryCorModel: []),
  };
}
