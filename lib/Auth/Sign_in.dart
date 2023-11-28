import 'dart:convert';

import 'package:Osus/config/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Osus/Auth/widgets/SignWidget.dart';
import 'package:Osus/Auth/widgets/TextFieldWidget.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/language_change_controller.dart';
import '../generated/l10n.dart';
import 'Sign_up.dart';

class SigninPage extends StatefulWidget {


  Future<String> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password cannot be empty');
    }

    final String apiUrl = 'https://osus.academy/home/user_login_api';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String authToken = data['token'];
      print('Token is :$authToken');
      return authToken;
    } else {
      throw Exception('Failed to sign in');
    }
  }

  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}
enum Language{English,Arabic}
class _SigninPageState extends State<SigninPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();


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



                Container(
                  height: 250.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100.r),


                    ),
                    child: LogoImage.logoImage),

                Container(
                  height: 48.h,
                  width: 300.w,
                  child: reusableTextField(
                    S.of(context).email,
                    Icons.email_outlined,
                    false,
                    _emailTextController,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 48.h,
                  width: 300.w,
                  child: reusableTextField(
                    S.of(context).password,
                    Icons.password,
                    true,
                    _passwordTextController,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SignInSignupButton(context, true, _emailTextController, _passwordTextController),

                // Container(
                //   height: 48.h,
                //   width: 300.w,
                //   child: Center(
                //     child: Text(
                //       "Sign In",
                //       style: TextStyle(color: Colors.white, fontSize: 20.sp),
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //       color: Colors.blueAccent.withAlpha(200),
                //       borderRadius: BorderRadius.circular(20.r)),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          S.of(context).dont_have_account,
                          style: TextStyle(
                              color: Colors.blue.shade700,
                              fontFamily: 'Manrope',
                              fontSize: 12.sp),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            S.of(context).create,
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
