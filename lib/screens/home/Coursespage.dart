import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../config/Config.dart';
import '../../models/CategoryCorModel.dart';
import '../../models/lessonModel.dart';
import '../../services/get_all_courses.dart';
import '../Course/CoursePage.dart';
import '../profile/search.dart';
import 'home_page.dart';

class CoursesPage extends StatefulWidget {
  final int containerIndex;
  final List<Lesson> lessonModel;
  CoursesPage(
      {Key? key, required this.containerIndex, required this.lessonModel})
      : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  late Future<List<Lesson>> lessonModelFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the lessonModelFuture in the initState
    // lessonModelFuture = getAllCoursesPageOfCategory(widget.containerIndex+1);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),

          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed('/secondScreen');
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [LogoImage.logoImage],
                ),
              ],
            ),
          ),
          Container(
            height: 40.h,
            width: 325.w,
            child: Padding(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen(
                                  recentCourses: [],
                                )),
                      );
                    },
                    child: Icon(
                      Icons.search,
                      size: 28,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.005,
                  ),
                  Text(
                    'What you want to learn ?',
                    style: theme.textTheme.bodyText2?.copyWith(
                        fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                  Icon(
                    Icons.menu_sharp,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(8.r),
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

          Text(
            'You tapped on container with index: ${widget.containerIndex}',
            style: TextStyle(
              fontSize: 18,
              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
            ),
          ),

          // Use FutureBuilder to handle the asynchronous call
          Expanded(
            child: FutureBuilder<List<Lesson>>(
              future: lessonModelFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No data available');
                } else {
                  // Data has been successfully fetched, display the GridView
                  List<Lesson> lessonModel = snapshot.data!;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 12.h,
                    ),
                    itemCount: lessonModel.length,
                    itemBuilder: (context, index) {
                      print('Building item at index $index');
                      Lesson currentLesson = lessonModel[index];

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                        ),
                        itemCount: lessonModel.length,
                        itemBuilder: (context, index) {
                          print('Building item at index $index');
                          Lesson currentLesson = lessonModel[index];

                          return GestureDetector(
                            onTap: () {
                              // // Navigate to the VideoPage when tapped
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => VideoPage(videoUrl: '',),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.all(6),
                              height: 100.h,
                              width: 100.w,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(right: 5.w, left: 15.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Text(
                                          currentLesson.name,
                                          style: theme.textTheme.bodyText1
                                              ?.copyWith(
                                            fontFamily: isArabic()
                                                ? 'Cairo'
                                                : 'aloevera',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: Image.asset(
                                          'assets/img/appicon.png', // Replace with the path to your default image asset
                                          width: 140.w,
                                          height: 75.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


    //  Container(
//         height: 600.h,
//         width: 600.w,
//         padding: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: AppColors.containerColor,
//           borderRadius: BorderRadius.circular(15.r),
//         ),
//         child: Column(
//           children: [
//             // Header with dropdown
//             Row(
//               children: [
//                 Container(
//                   height: 40.h,
//                   width: 310.h,
//                   color: Colors.red,
//                   child: Row(
//                     children: [
//                       SizedBox(width: 30.w),
//                       Text(
//                         "introduction",
//                         style: TextStyle(
//                           color: AppColors.secoundfontColor,
//                           fontFamily: 'Manrope',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14.sp,
//                         ),
//                       ),
//                       Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             isDropdownOpen = !isDropdownOpen;
//                           });
//                         },
//                         child: Icon(Icons.arrow_drop_down_outlined),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // Content inside dropdown
//             Visibility(
//               visible: isDropdownOpen,
//               child: Container(
//                 height: 300.h, // Adjust height as needed
//                 child: FutureBuilder<List<Lesson>>(
//                   future: lessonModelFuture,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return CircularProgressIndicator();
//                     } else if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Text('No data available');
//                     } else {
//                       List<Lesson> lessonModel = snapshot.data!;
//                       return ListView.builder(
//                         itemCount: lessonModel.length,
//                         itemBuilder: (context, index) {
//                           Lesson currentLesson = lessonModel[index];
//
//                           return GestureDetector(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => VideoPage(videoUrl: currentLesson.video),
//                               ),
//                             ),
//                             child: Container(
//                               margin: EdgeInsets.all(5),
//                               height: 50.h,
//                               width: 100.w,
//                               padding: EdgeInsets.only(right: 15.w, left: 0.w),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 20.h),
//                                   Row(
//                                     children: [
//                                       SizedBox(width: 30.w),
//                                       Text(
//                                         currentLesson.name,
//                                         style: TextStyle(
//                                           color: AppColors.secoundfontColor,
//                                           fontFamily: 'Manrope',
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 14.sp,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius: BorderRadius.circular(8.r),
//                                 border: Border.all(color: Colors.grey.shade300),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.2),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

