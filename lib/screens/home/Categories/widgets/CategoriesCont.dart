import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/Config.dart';
import '../../../../models/Categorymodel.dart';

class Cont extends StatelessWidget {
  Cont({required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    String imageUrl = category.image;
    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = 'https://osus.academy/$imageUrl';
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
              border: Border.all(color: Colors.grey.shade300),
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
                      'assets/img/OSUSlogo.png', // Replace with the path to your default image asset
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
                category.en_name,
                style: TextStyle(
                  color: AppColors.mainfontColor,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
