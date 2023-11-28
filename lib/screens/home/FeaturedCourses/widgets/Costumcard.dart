import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/Config.dart';
import '../../../../models/FeaturedCoursesmodel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.fcategory,
  });
  final FCModel fcategory;

  @override
  Widget build(BuildContext context) {
    String imageUrl = fcategory.image;
    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = 'https://osus.academy/uploads/$imageUrl';
      print(imageUrl);
    }

    return Container(
      margin: EdgeInsets.only(left: 10.w, bottom: 10.h),
      height: 190.h,
      width: 160.w,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              imageUrl,
              width: 160.w,
              height: 80.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                print('Error loading image: $imageUrl');

                return Container();
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: Text(fcategory.title,
                style: TextStyle(
                  color: AppColors.secoundfontColor,                  fontFamily: 'Manrope',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: SingleChildScrollView(
              child: Text(fcategory.short_details,
                  style: TextStyle(
                    color: AppColors.smalltextfontColor,

                    fontFamily: 'Manrope',
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
