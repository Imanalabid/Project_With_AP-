// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:http/http.dart' as http;
// import '../../generated/l10n.dart';
// import '../../screens/home/homescreen.dart';
//
//
// Container SignInSignupButton(
//     BuildContext context,
//     bool isLogin,
//     TextEditingController emailController,
//     TextEditingController passwordController,
//     ) {
//   return Container(
//     height: 48.h,
//     width: 300.w,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20.r),
//     ),
//     child: ElevatedButton(
//       onPressed: () async {
//         String email = emailController.text.trim();
//         String password = passwordController.text;
//
//         if (email.isEmpty || password.isEmpty) {
//           // Show an error message or handle empty fields
//           return;
//         }
//
//         http.Response response = await http.post(
//           Uri.parse('${ApiVariables.BASE_URL}/home/user_login_api'),
//           body: {
//             "email": email,
//             "password": password,
//           },
//         );
//
//         if (response.statusCode == 200) {
//           dynamic responseData = json.decode(response.body);
//
//           if (responseData is Map<String, dynamic> && responseData['state'] == true) {
//             // Authentication success, navigate to HomeScreen
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomeScreen(),
//               ),
//             );
//           } else {
//             // Authentication failed, show an error message
//             print('Authentication failed: $responseData');
//             // Display an error message to the user
//             // You may use a Snackbar, Dialog, or any other method to display errors
//           }
//         } else {
//           print('Request failed with status: ${response.statusCode}');
//           // Handle the failure, show an error message, etc.
//         }
//       },
//
//
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.r),
//           ),
//         ),
//         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//               (Set<MaterialState> states) {
//             if (states.contains(MaterialState.pressed)) {
//               return Colors.blue; // Color when the button is pressed
//             }
//             return Colors.blueAccent.withAlpha(200); // Default color
//           },
//         ),
//       ),
//       child: Text(
//         isLogin ? S.of(context).login : S.of(context).sign_up,
//         style: TextStyle(color: Colors.white, fontSize: 20.sp),
//       ),
//     ),
//   );
// }