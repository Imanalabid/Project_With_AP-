import 'package:Osus/screens/home/Coursespage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/Config.dart';
import '../../generated/l10n.dart';
import '../../models/CategoryCorModel.dart';
import 'package:Osus/models/CategoryCorModel.dart' as CategoryCor;
import 'package:Osus/models/lessonModel.dart' as Lesson;
import '../Course/CoursePage.dart';
import 'home_page.dart';

class SecondScreen extends StatefulWidget {

  // final String item;
  // final List<CategoryCorModel> categoryCorModelList; // Change this line
  // final int containerIndex;
  //
  // SecondScreen({required this.categoryCorModelList, required this.item, required this.containerIndex});
  final List<CourseModel> categoryCorModel;
  SecondScreen({Key? key, required this.categoryCorModel, }) : super(key: key);
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {


   print('Category Cor Model List Length: ${widget.categoryCorModel.first.details}');

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Column(
            //   children: [
            //     Text(categoryCorModelList.length),
            //     Text(categoryCorModelList.title),
            //     Text('${categoryCorModelList.details}'),
            //     Text('${categoryCorModelList.id}'),
            //     // Text(categoryModel),
            //   ],
            // ),
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
                        Navigator.pushNamed(context, '/home');
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
                padding:  EdgeInsets.only(
                    left: isArabic()? 20.w:10.w,
                    right: isArabic()?10.w:10.w
                ),
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
                      S.of(context).what_you_want_to_learn,
                      style: TextStyle(
                          color: AppColors.smalltextfontColor,
                          fontFamily: 'Manrope',
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                        width:isArabic()?MediaQuery.of(context).size.width*0.38.w:MediaQuery.of(context).size.width*0.33
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


           // Text('Container Index: ${widget.containerIndex}'), // Display the container index

            // Container(
            //   height: 50,
            //   width: double.infinity,
            //   color: AppColors.containerColor,              margin: EdgeInsets.all(8),
            //   child: Center(
            //     child: Text('Container ${widget.containerIndex} Content'),
            //   ),
            // ),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 12.h,
                ),
                itemCount: widget.categoryCorModel.length,
                itemBuilder: (context, index) {
                  print('Building item at index $index');
                  //CategoryCorModel categoryCorModel = widget.categoryCorModelList[index];

                  // String imageUrl = widget.categoryCorModel[index].image;
                  // if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
                  //   imageUrl = 'https://osus.academy/upload/$imageUrl';
                  //   print(imageUrl);
                  // }

                  return GestureDetector(
                    onTap: () {
                      // Navigate to the CoursePage when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursesPage(containerIndex: index, lessonModel:[]),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(6),
                      child: Padding(
                        padding:  EdgeInsets.only(right: 5.w, left: 15.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Your existing container content...
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.01,
                                ),

                                Flexible(
                                  child: Text(
                                    widget.categoryCorModel[index].title,
                                    style: TextStyle(
                                      color: AppColors.secoundfontColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                    maxLines: 2, // Set the maximum number of lines
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [

                                  Container(

                                    child: ClipRRect(

                                      child: Image.asset(
                                        'assets/img/OSUSlogo.png'
                                        , // Replace with the path to your default image asset
                                        width: 140.w,
                                        height: 75.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),


                                //
                                // Flexible(
                                //   child: Image.network(
                                //     widget.categoryCorModel[index].image,
                                //
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.03,
                                ),

                              ],
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
              ),
            ),


          ],
        ),
      ),
    );
  }
}
