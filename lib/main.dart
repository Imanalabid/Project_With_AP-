import 'package:Taallam/config/Config.dart';
import 'package:Taallam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/Sign_in.dart';
import 'Auth/Sign_up.dart';
import 'Route/route_helper.dart';
import 'controller/language_change_controller.dart';
import 'generated/l10n.dart';
import 'screens/home/splash_Screen.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
            builder: (context, languageProvider, child) {
              return GetMaterialApp(
                key: UniqueKey(),
                locale: languageProvider.appLocale ?? Locale('ar'),
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('ar'), // Arabic
                  Locale('en'), // English
                ],
                theme: Themes.customLightTheme,
                debugShowCheckedModeBanner: false,
                initialRoute: RouteHelper.splash,
                getPages: RouteHelper.getPages,
              );
            },
          ),
        );
      },
    );
  }
}
