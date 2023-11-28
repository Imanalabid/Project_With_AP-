import 'package:Osus/screens/home/CategoryCoursespage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Osus/Auth/Sign_in.dart';
import 'package:Osus/screens/Course/CoursePage.dart';
import 'package:Osus/screens/Course/CoursesCardPage.dart';
import 'package:Osus/screens/Course/CoursesDetails/CoursesDetails.dart';
import 'package:Osus/screens/Course/Widgets/UpWidget.dart';
import 'package:Osus/screens/profile/profile.dart';
import 'package:Osus/screens/profile/userinfo.dart';
import 'package:Osus/screens/home/FeaturedCourses/FeaturedCoursesPage.dart';
import 'package:Osus/screens/home/home_page.dart';
import 'package:Osus/screens/home/homescreen.dart';

import 'package:Osus/screens/home/popularcoursespage.dart';
import 'package:Osus/screens/home/splash_Screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Auth/Sign_up.dart';

import 'Route/route_helper.dart';
import 'controller/language_change_controller.dart';
import 'generated/l10n.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => LanguageChangeController()),
            ],
            child: Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
          return MaterialApp(
          //  locale: Locale('ar'),
             locale: provider.appLocale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('ar'),


          ],
         //   supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            initialRoute: RouteHelper.splash,
            routes: RouteHelper.routes,

                  );
                },
              ),
          );
        });
  }
}
