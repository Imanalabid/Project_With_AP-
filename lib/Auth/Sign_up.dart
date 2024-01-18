import 'dart:convert';
import 'package:Taallam/theme/theme.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:Taallam/Auth/widgets/SignWidget.dart';
import 'package:Taallam/Auth/widgets/TextFieldWidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/Config.dart';
import '../controller/language_change_controller.dart';
import '../generated/l10n.dart';
import '../screens/home/home_page.dart';
import 'Sign_up.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

enum Language { English, Arabic }

class _SignupPageState extends State<SignupPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  late SharedPreferences prefs;
  late int token;

  String? authToken;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    // Check for the logged-in user once the prefs are initialized
    checkLoggedInUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: theme.brightness == Brightness.dark
                    ? AssetImage("assets/img/app1.png")
                    : AssetImage("assets/img/App.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  theme.backgroundColor, // Set your desired opacity here
                  BlendMode.dstATop, // Adjust blend mode as needed
                ),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 25.h, right: 15.w, left: 15.w),
                    child: Column(
                      children: [
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
                        SizedBox(
                          height: 150.h,
                        ),
                        Container(
                            height: 120.h,
                            width: 250.w,
                            child: LogoImage.logoImage),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r))),
                    height: 400.h,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.w, left: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          // _buildGreyText("Please login with your information"),
                          _buildGreyText(S.of(context).email),
                          _buildInputField(_emailTextController),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          _buildGreyText(S.of(context).password),
                          _buildInputField(_passwordTextController,
                              isPassowrd: true),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          _buildLoginButton(
                              _emailTextController, _passwordTextController),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).have_account,
                                    style: theme.textTheme.bodyText2?.copyWith(
                                      fontFamily:
                                          isArabic() ? 'Cairo' : 'aloevera',
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/signin');
                                    },
                                    child: Text(
                                      'سجل دخول',
                                      style:
                                          theme.textTheme.bodyText1?.copyWith(
                                        fontFamily:
                                            isArabic() ? 'Cairo' : 'aloevera',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      ],
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassowrd = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon:
              isPassowrd ? Icon(Icons.remove_red_eye) : Icon(Icons.done)),
      obscureText: isPassowrd,
    );
  }

  Widget _buildLoginButton(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return ElevatedButton(
      onPressed: () async {
        String email = emailController.text.trim();
        String password = passwordController.text;

        if (email.isEmpty || password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Email and password are required.',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                ),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
          return;
        }

        try {
          http.Response response = await http.get(
            Uri.parse(
                'https://taallam-platform.com/home/user_login_api?email=$email&password=$password'),

            // Uri.parse(
            //     '${ApiVariables.usersignin}?email=$email&password=$password'),
          );

          print('Response status code: ${response.statusCode}');
          print('Response body: ${response.body}');

          if (response.statusCode == 200) {
            var responseBody = json.decode(response.body);

            if (responseBody is int) {
              print('Token: $responseBody');

              await prefs.setString('email', email);
              await prefs.setString('password', password);
              await prefs.setInt('token', responseBody);

              // Clear any existing token from SharedPreferences
              // prefs.remove('token');

              Get.offAllNamed('/home', arguments: {'email': email});
            } else {
              // Handle other response formats if needed
              print('Unexpected response format: $responseBody');
            }
          } else {
            // Handle other HTTP response statuses
            print('Request failed with status: ${response.statusCode}');
            print('Error message: ${response.body}');
          }
        } catch (e) {
          print('Error during API call: $e');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'An error occurred. Please try again later.',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                ),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      },
      child: Text(
        S.of(context).sign_up,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontFamily: isArabic() ? 'Cairo' : 'aloevera',
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue;
            }
            return Colors.blueAccent.withAlpha(200);
          },
        ),
        elevation: MaterialStateProperty.all<double>(20),
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
        minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(60)),
      ),
    );
  }

  Widget _buildGreyText(String text) {
    final ThemeData theme = Theme.of(context);

    return Text(
      text,
      style: theme.textTheme.bodyText1?.copyWith(
          fontFamily: isArabic() ? 'Cairo' : 'aloevera', fontSize: 14.sp),
    );
  }

  void checkLoggedInUser(BuildContext context) async {
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (savedEmail != null && savedPassword != null) {
      Get.offAllNamed('/home', arguments: {'email': savedEmail});
    }
  }
}
