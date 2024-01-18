import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Auth/Sign_in.dart';
import '../Auth/Sign_up.dart';
import '../screens/Course/CoursePage.dart';
import '../screens/Course/CoursesDetails/widgets/dropdown.dart';
import '../screens/Course/newCoursesPage.dart';
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
  static const String NCourses = '/NCoursesPage';
  static const String Dropdown = '/DropdownPage';

  static const String secondScreen = '/SecondScreen';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    home: (context) => HomeScreen(),
    signinPage: (context) => SigninPage(),
    homepage: (context) => HomePage(
          sliderModel: [],
        ),
    featuredCourses: (context) => FCourses(fcategory: []),
    popularCourses: (context) => PCourses(),
    profile: (context) => Profile(
          context: context,
        ),
    userinfo: (context) => UserInfo(),
    signin: (context) => SigninPage(),
    signup: (context) => SignupPage(),
    Dropdown: (context) => DropdownPage(
          courseID: '',
          video: '',
        ),

    // NCourses: (context) => NCoursesPage(
    //       lessonModel: [],
    //       containerIndex: 0,
    //       courseModel: [],
    //       videoUrl: '',
    //     ),
    coursePage: (context) => CoursePage(),
    pcourses: (context) => PCourses(),
    secondScreen: (context) => SecondScreen(categoryCorModel: []),
  };
  static final List<GetPage> getPages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: signinPage,
      page: () => SigninPage(),
    ),
    GetPage(
      name: featuredCourses,
      page: () => FCourses(
        fcategory: [],
      ),
    ),
    GetPage(
      name: homepage,
      page: () => HomePage(
        sliderModel: [],
      ),
    ),
    GetPage(
      name: popularCourses,
      page: () => PCourses(),
    ),
    GetPage(
      name: profile,
      page: () => Profile(context: Get.context!),
    ),
    GetPage(
      name: userinfo,
      page: () => UserInfo(),
    ),
    GetPage(
      name: signin,
      page: () => SigninPage(),
    ),
    GetPage(
      name: Dropdown,
      page: () => DropdownPage(
        courseID: '',
        video: '',
      ),
    ),
    GetPage(
      name: signup,
      page: () => SignupPage(),
    ),
    // GetPage(
    //   name: NCourses,
    //   page: () => NCoursesPage(
    //     containerIndex: 0,
    //     lessonModel: [],
    //     courseModel: [],
    //     videoUrl: '',
    //   ),
    // ),
    GetPage(
      name: coursePage,
      page: () => CoursePage(),
    ),
    GetPage(name: pcourses, page: () => PCourses()),
    GetPage(
      name: secondScreen,
      page: () => SecondScreen(
        categoryCorModel: [],
      ),
    ),
  ];
}
