import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:Osus/Auth/widgets/SignWidget.dart';
import 'package:Osus/Auth/widgets/TextFieldWidget.dart';
import 'package:provider/provider.dart';

import '../config/Config.dart';
import '../controller/language_change_controller.dart';
import '../generated/l10n.dart';
import 'Sign_up.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}
enum Language{English,Arabic}

class _SignupPageState extends State<SignupPage> {
  TextEditingController passwordTextController = TextEditingController();

  TextEditingController emailTextController = TextEditingController();
  void login(String email ,password) async{
    try{
      Response response =await post(Uri.parse('https://osus.academy/home/user_login_api'),
        body: {
        'email':email,
          'password':password
          }
      );
      if(response.statusCode==200){
        print('account created');
      }else{
        print('failed');
      }
    }catch(e){
      print(e.toString());

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 25.h, right: 15.w, left: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                              child: Text('English',),
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



                Container(
                    height: 250.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100.r),


                    ),
                    child: LogoImage.logoImage),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 48.h,
                  width: 300.w,
                  child: reusableTextField(
                   "email",
                    Icons.email_outlined,
                    true,
                    emailTextController,
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 48.h,
                  width: 300.w,
                  child: reusableTextField(
                    "password",
                    Icons.password,
                    true,
                    passwordTextController,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Container(
                  height: 48.h,
                  width: 300.w,
                  child: ElevatedButton(
                    onPressed: () {
                      login(emailTextController.text.toString(),passwordTextController.text.toString());

                    },
                    child: Text(
                   "new_account",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.transparent;
                          }
                        })),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withAlpha(200),
                      borderRadius: BorderRadius.circular(20.r)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "have Account ?",
                          style: TextStyle(
                              color: Colors.blue.shade700,
                              fontFamily: 'Manrope',
                              fontSize: 12.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                          child: Text(
                      "login",
                            style: TextStyle(
                                color: Colors.blue.shade700,
                                fontFamily: 'Manrope',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
