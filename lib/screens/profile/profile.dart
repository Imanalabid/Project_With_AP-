import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Auth/Sign_in.dart';
import '../../config/Config.dart';
import '../../controller/language_change_controller.dart';
import '../../generated/l10n.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic(){
      return Intl.getCurrentLocale()=='ar';

      // left: isArabic?0:16

    }
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
          Padding(
            padding:  EdgeInsets.only(
                right: isArabic()? 14.w:10.w,
                left: isArabic()? 10.w:14.w,
            ),
            child: Row(
              children: [
                Consumer<LanguageChangeController>(
                  builder: (context, provider, child) {
                    return PopupMenuButton<Language>(
                      icon: Icon(
                        Icons.language,
                        color: AppColors.secoundfontColor,
                        size: 40,// Set the desired color here
                      ),
                      onSelected: (Language item) {
                        if (Language.English.name == item.name) {
                          provider.changeLanguage(Locale('en'));
                        } else {
                          provider.changeLanguage(Locale('ar'));
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
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
          Navigator.pushNamed(context, '/userinfo');
        },
        child: Container(
          height: 50.h,
          width: 320.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7, left: 12),
                child: Icon(Icons.person_outline,
                    size: 25, color: Colors.blue.shade800),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(  S.of(context).user_info,
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0.sp,
                        color: Colors.grey.shade800,
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
                      color: Colors.blue.shade900,
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
                      color: Colors.blue.shade300,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue.shade100,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7, left: 12),
                child: Icon(Icons.privacy_tip_outlined,
                    size: 25, color: Colors.blue.shade800),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(  S.of(context).privacy_policy,
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0.sp,
                        color: Colors.grey.shade800,
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
                      color: Colors.blue.shade900,
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
                      color: Colors.blue.shade300,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue.shade100,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7, left: 12),
                child: Icon(Icons.note_add_outlined,
                    size: 25, color: Colors.blue.shade800),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(  S.of(context).repots,
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0.sp,
                        color: Colors.grey.shade800,
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
                      color: Colors.blue.shade900,
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
                      color: Colors.blue.shade300,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue.shade100,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7, left: 12),
                child: Icon(Icons.support_agent,
                    size: 25, color: Colors.blue.shade800),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(  S.of(context).support,
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0.sp,
                        color: Colors.grey.shade800,
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
                      color: Colors.blue.shade900,
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
                      color: Colors.blue.shade300,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue.shade100,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7, left: 12),
                child: Icon(Icons.info_outline,
                    size: 25, color: Colors.blue.shade800),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(  S.of(context).about_us,
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0.sp,
                        color: Colors.grey.shade800,
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
                      color: Colors.blue.shade900,
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
                      color: Colors.blue.shade300,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue.shade100,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7, left: 12),
                child: Icon(Icons.logout_outlined,
                    size: 25, color: Colors.blue.shade800),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(  S.of(context).log_out,
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0.sp,
                        color: Colors.grey.shade800,
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
                      color: Colors.blue.shade900,
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
                      color: Colors.blue.shade300,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue.shade100,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }
}

// void _launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
