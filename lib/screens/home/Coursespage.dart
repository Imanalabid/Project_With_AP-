import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/Config.dart';
import '../../models/CategoryCorModel.dart';
import '../../models/lessonModel.dart';
import '../../services/get_all_courses.dart';
import '../Course/CoursePage.dart';

class CoursesPage extends StatefulWidget {
  final int containerIndex;
  final List<LessonModel> lessonModel;
  CoursesPage({Key? key, required this.containerIndex, required this.lessonModel}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  late Future<List<LessonModel>> lessonModelFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the lessonModelFuture in the initState
    lessonModelFuture = getAllCoursesPageOfCategry(widget.containerIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ... (your existing header and search bar code)

          // ... (your existing code)
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
                      Navigator.pushNamed(context, '/SecondScreen');
                    },
                    child: Icon(Icons.arrow_back_ios,color: AppColors.Icon1Color,)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LogoImage.logoImage
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 40.h,
            width: 325.w,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: AppColors.Icon1Color,
                    size: 28,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.005,
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

          // Text(
          //   'You tapped on container with index: ${widget.containerIndex}',
          //   style: TextStyle(fontSize: 18),
          // ),

          // Use FutureBuilder to handle the asynchronous call
          Expanded(
            child: FutureBuilder<List<LessonModel>>(
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
                  List<LessonModel> lessonModel = snapshot.data!;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 12.h,
                    ),
                    itemCount: lessonModel.length,
                    itemBuilder: (context, index) {
                      print('Building item at index $index');
                      LessonModel currentLesson = lessonModel[index];

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 12.w, // Adjust cross-axis spacing
                          mainAxisSpacing: 12.h, // Adjust main-axis spacing
                        ),
                        itemCount: lessonModel.length,
                        itemBuilder: (context, index) {
                          print('Building item at index $index');
                          LessonModel currentLesson = lessonModel[index];

                          return GestureDetector(
                            onTap: () {
                              // Navigate to the CoursePage when tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoursesPage(containerIndex: index, lessonModel: [lessonModel[index]]),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(6),
                              // Change height and width as needed
                              height: 100.h,
                              width: 100.w,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5.w, left: 15.w),
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
                                          style: TextStyle(
                                            color: AppColors.secoundfontColor,
                                            fontFamily: 'Manrope',
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
                                        borderRadius: BorderRadius.circular(8.r),
                                        child: Image.asset(
                                          'assets/img/OSUSlogo.png'
                                          , // Replace with the path to your default image asset
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
