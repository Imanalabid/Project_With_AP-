import 'package:Osus/models/CategoryCorModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/FeaturedCoursesmodel.dart';
import 'Widgets/UpWidget.dart';
import 'Widgets/tabbar.widget.dart';

class CoursePage extends StatelessWidget {
  // final CourseModel course;
  //  CoursePage({super.key,required this.course});

  // Choose one FCModel instance from the list




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 310.h,
            color: Colors.red,
            child: CourseWidget(),
          ),
          Container(
            height: 310.h,
            color: Colors.red,
            child: Tabbar( ),
          ),
        ],
      ),
    );
  }
}


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

            ],
          ),
        ),
      ),
    );
  }
}


class Tabbar extends StatelessWidget {
  Tabbar({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab( child: Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),),
                Tab( child: Text(
                  'Review',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 10.w,left: 10.w,top: 20.h),
                    child: Text(
                      "هذا الكورس موجه لجميع طلاب الهندسات في مختلف الكليات في أنحاء العالم .. وهو موجه للطلاب الذين يدرسون في الجامعات التركية أو الجامعات التي تدرس باللغة الانكليزية أو الألمانية</p><p dir=\"rtl\">في هذا الكورس سنشرح مادة الديناميك بالتفصيل الممل مروراً بالحركة المستقيمة المنتظمة والحركة المستقيمة المتغيرة بانتظام والحركة الدائرية المنتظمة والحركة الدائرية المتغيرة بانتظام كما سنشرح بالتفصيل الحركة المنحنية</p><p dir=\"rtl\">سنشرح مفاهيم الكيناميتك Kinematik للحركة من حيث شرح المفاهيم الهندسية للحركة وهي الإازحة والسرعة والتسارع والزومن وكيفية اشتقاق العلاققات فيما بينهم</p><p dir=\"rtl\">كما سنتعامل مع المخططات وكيفية رسم الجوانب الهندسية للحركة للإزاحة والسرعة والتسارع</p><p dir=\"rtl\">سنناقش قانون نيوتن الثاني وهو مجموع القوى المؤثرة على جسم تساوي جداء كتلته في تسارعه<br></p><p dir=\"rtl\">سنقوم بحل العديد من المسائل على مماسبق من حيث اشتقاق المسافة والسرعة أو من حيث تكامل السرعة والتسارع أيضاً سنقوم بحل مسائل على رسم المخططات وكيفية الاستفادة منها للح"
                      , style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400),),
                  ),


                  // Content of Tab 2
                  Container(
                    // Add your content for Tab 2 here
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
