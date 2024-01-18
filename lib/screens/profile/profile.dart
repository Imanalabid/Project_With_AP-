import 'package:Taallam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/Sign_in.dart';
import '../../config/Config.dart';
import '../../controller/language_change_controller.dart';
import '../../generated/l10n.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.context});
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    bool isArabic() {
      return Intl.getCurrentLocale() == 'ar';
    }

    final ThemeData theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: isArabic() ? 14.w : 10.w,
                left: isArabic() ? 10.w : 14.w,
              ),
              child: Row(
                children: [
                  Consumer<LanguageChangeController>(
                    builder: (context, provider, child) {
                      return PopupMenuButton<Language>(
                        icon: Icon(
                          Icons.language,
                          size: 25,
                        ),
                        onSelected: (Language item) {
                          if (Language.English.name == item.name) {
                            provider.changeLanguage(Locale('en'));
                          } else {
                            provider.changeLanguage(Locale('ar'));
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<Language>>[
                          PopupMenuItem<Language>(
                            value: Language.English,
                            child: Text('English'),
                          ),
                          PopupMenuItem<Language>(
                            value: Language.Arabic,
                            child: Text('Arabic'),
                          ),
                        ],
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.brightness_6),
                    onPressed: () {
                      if (Get.isDarkMode) {
                        Get.changeTheme(Themes.customLightTheme);
                      } else {
                        Get.changeTheme(Themes.customDarkTheme);
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  backgroundImage: AssetImage('assets/img/profile.png'),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/userinfo');
              },
              child: Container(
                height: 50.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 7, left: 12),
                      child: Icon(
                        Icons.person_outline,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(S.of(context).user_info,
                          style: theme.textTheme.bodyText1?.copyWith(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned(
                          left: 15,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Positioned(
                          right: 20,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 7, left: 12),
                      child: Icon(
                        Icons.privacy_tip_outlined,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(S.of(context).privacy_policy,
                          style: theme.textTheme.bodyText1?.copyWith(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned(
                          left: 15,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Positioned(
                          right: 20,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 7, left: 12),
                      child: Icon(
                        Icons.note_add_outlined,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(S.of(context).repots,
                          style: theme.textTheme.bodyText1?.copyWith(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned(
                          left: 15,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Positioned(
                          right: 20,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 7, left: 12),
                      child: Icon(
                        Icons.support_agent,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(S.of(context).support,
                          style: theme.textTheme.bodyText1?.copyWith(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned(
                          left: 15,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Positioned(
                          right: 20,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 7, left: 12),
                      child: Icon(
                        Icons.info_outline,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(S.of(context).about_us,
                          style: theme.textTheme.bodyText1?.copyWith(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned(
                          left: 15,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Positioned(
                          right: 20,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              onTap: logOut,
              child: Container(
                height: 50.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 7, left: 12),
                      child: Icon(
                        Icons.logout_outlined,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(S.of(context).log_out,
                          style: theme.textTheme.bodyText1?.copyWith(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned(
                          left: 15,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Positioned(
                          right: 20,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ]),
        ));
  }
}

void logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear(); // Clear user information from SharedPreferences
  Get.offAllNamed('/signin');
}
