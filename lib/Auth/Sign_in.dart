import 'dart:convert';
import 'package:Taallam/Auth/auth_state.dart';
import 'package:Taallam/Auth/widgets/TextFieldWidget.dart';
import 'package:Taallam/config/Config.dart';
import 'package:Taallam/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/language_change_controller.dart';
import '../generated/l10n.dart';
import '../screens/home/home_page.dart';
import '../screens/home/homescreen.dart';
import 'Sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

enum Language { English, Arabic }

class _SigninPageState extends State<SigninPage> {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

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
                        EdgeInsets.only(top: 20.h, right: 15.w, left: 15.w),
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
                          height: MediaQuery.of(context).size.height * 0.21,
                        ),
                        Container(
                            height: 110.h,
                            width: 250.w,
                            child: LogoImage.logoImage),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                          Center(child: Text('أو قم بتسجيل الدخول بواسطة ')),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Container(
                                height: 40.h,
                                width: 40.w,
                                child: Image.asset("assets/img/fb.png"),
                                decoration: BoxDecoration(
                                    color: theme.cardColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30.r)),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () async {
                                  UserCredential? userCredential =
                                      await signInWithGoogle();

                                  if (userCredential != null) {
                                    User? user = userCredential.user;

                                    // Handle the signed-in user here, e.g., navigate to a new screen
                                    if (user != null) {
                                      // Navigate to the new screen or update the UI
                                      print(
                                          "Signed in with Google: ${user.displayName}");
                                      Get.toNamed('/initial');
                                    } else {
                                      // Handle the case when the user is null
                                      print("Failed to sign in with Google");
                                    }
                                  }
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  child: Image.asset("assets/img/google.png"),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(30.r)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).dont_have_account,
                                    style: theme.textTheme.bodyText2?.copyWith(
                                      fontFamily:
                                          isArabic() ? 'Cairo' : 'aloevera',
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/signup');
                                    },
                                    child: Text(
                                      S.of(context).create,
                                      style:
                                          theme.textTheme.bodyText1?.copyWith(
                                        fontFamily:
                                            isArabic() ? 'Cairo' : 'aloevera',
                                        fontSize: 12.sp,
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
              isPassowrd ? Icon(Icons.remove_red_eye) : Icon(Icons.email)),
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
              backgroundColor: Colors.blue.shade600,
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
        S.of(context).login,
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
