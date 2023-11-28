import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/img/wp.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, right: 15.w, left: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/FeaturedCourses');
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Manrope',
                        fontSize: 18.sp),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WordPress development',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Text(
                        'bigineer guid                         ',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Jon Smith                         ',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        '(4.5) based on 20 review',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 35.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Icon(Icons.alarm_rounded,
                                    color: Colors.purple.shade900),
                                Text(
                                  ' 23 Hours',
                                  style: TextStyle(
                                      color: Colors.purple.shade900,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Container(
                            height: 35.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Icon(Icons.alarm_rounded,
                                    color: Colors.purple.shade900),
                                Text(
                                  ' 23 Hours',
                                  style: TextStyle(
                                      color: Colors.purple.shade900,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Container(
                            height: 35.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Icon(Icons.alarm_rounded,
                                    color: Colors.purple.shade900),
                                Text(
                                  ' 23 Hours',
                                  style: TextStyle(
                                      color: Colors.purple.shade900,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(),
              Row(),
              Row(),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
