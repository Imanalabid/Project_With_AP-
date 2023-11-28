import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import '../../generated/l10n.dart';
import '../../screens/home/homescreen.dart';

Container SignInSignupButton(
    BuildContext context,
    bool isLogin,
    TextEditingController emailController,
    TextEditingController passwordController,
    ) {
  return Container(
    height: 48.h,
    width: 300.w,
    child: ElevatedButton(
      onPressed: () async {
        String email = emailController.text.trim();
        String password = passwordController.text;

        if (email.isEmpty || password.isEmpty) {
          // Show an error message or handle empty fields
          return;
        }

        http.Response response = await http.post(
          Uri.parse('https://osus.academy/home/user_login_api'),
          body: {
            "email": email,
            "password": password,
          },
        );

        if (response.statusCode == 200) {
          print(response.body);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          print('Request failed with status: ${response.statusCode}');
          // Handle the failure, show an error message, etc.
        }
      },
      child: Text(
        isLogin ?   S.of(context).login:   S.of(context).sign_up,
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
        }),
      ),
    ),
    decoration: BoxDecoration(
      color: Colors.blueAccent.withAlpha(200),
      borderRadius: BorderRadius.circular(20.r),
    ),
  );
}