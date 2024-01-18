import 'package:Taallam/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/Config.dart';
import '../../../../main.dart';
import '../../../../models/Categorymodel.dart';

class Cont extends StatelessWidget {
  Cont({required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    String imageUrl = category.image;
    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = '${ApiVariables.BASE_URL}/$imageUrl';
      print(imageUrl);
    }

    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 130.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                imageUrl,
                width: 140.w,
                height: 75.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return Container(
                    color: AppColors.containerColor,
                    child: Image.asset(
                      'assets/img/Taallamlogo.png', // Replace with the path to your default image asset
                      width: 140.w,
                      height: 75.h,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                isArabic() ? category.ar_name : category.en_name,
                style: theme.textTheme.bodyText1?.copyWith(
                  fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: theme.cardColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
