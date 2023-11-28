import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/FeaturedCoursesmodel.dart';
import '../../../config/Config.dart';

class PCont extends StatelessWidget {
  PCont({required this.pcategory});

  final FCModel pcategory;

  @override
  Widget build(BuildContext context) {
    String imageUrl = pcategory.image;
    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = 'https://osus.academy/uploads/$imageUrl';
      print(imageUrl);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      height: 65.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              imageUrl,
              width: 90.w,
              height: 120.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 8.w, bottom: 8.h, right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pcategory.title,
                  style: TextStyle(
                    color: AppColors.mainfontColor,                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pcategory.course_type,
                  style: TextStyle(
                    color: AppColors.secoundfontColor,
                    fontSize: 12.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
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
