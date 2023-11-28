import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/Config.dart';

class PCourses extends StatelessWidget {
  const PCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.Icon1Color,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LogoImage.logoImage
                    ],
                  ),
                ],
              ),

              Container(
                height: 38.h,
                width: 350.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.Icon1Color,
                        size: 28,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        'What you want to learn ?',
                        style: TextStyle(
                            color: AppColors.smalltextfontColor,
                            fontFamily: 'Manrope',
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                      Icon(Icons.menu_sharp,   color: AppColors.Icon1Color,)
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Programming Courses',
                    style: TextStyle(
                        color: AppColors.mainfontColor,
                        fontSize: 20.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Row(
                        children: [
                          Text('See All',
                              style: TextStyle(
                                color: Colors.transparent,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/CoursePage');
                },
                child: SizedBox(
                  height: 150.h,
                  child: FeaturedCor1(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: 150.h,
                child: FeaturedCor1(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: 150.h,
                child: FeaturedCor1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedCor1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 10.w),
          width: 160.w,
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
                  child: Image.asset(
                    'assets/img/wd.png',
                    width: 170.w,
                    height: 75.h,
                    fit: BoxFit.cover,
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
                    'App Developmet \nbigineer guide',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Text(
                    'Jon Smith',
                    style: TextStyle(
                      color: AppColors.smalltextfontColor,
                      fontSize: 10.sp,
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
      },
    );
  }
}
