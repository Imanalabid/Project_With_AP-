import 'package:Taallam/config/Config.dart';
import 'package:Taallam/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextField reusableTextField(
  BuildContext context,
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
) {
  final ThemeData theme = Theme.of(context);

  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      fontFamily: isArabic() ? 'Cairo' : 'aloevera',
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: theme.brightness == Brightness.dark
            ? AppColors.DIconColor
            : AppColors.Icon1Color,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.grey.withOpacity(0.9),
        fontSize: 18.sp,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(width: 0.w, style: BorderStyle.solid),
      ),
    ),
    onChanged: (value) {},
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
