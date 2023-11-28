import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Osus/models/FeaturedCoursesmodel.dart';
import 'package:Osus/screens/home/FeaturedCourses/widgets/Costumcard.dart';


import '../../../config/Config.dart';
import '../../../services/get_FeaturedCourses.dart';
import '../../Course/CoursesDetails/CoursesDetails.dart';

class FCourses extends StatelessWidget {
  final List<FCModel> fcategory;

  FCourses({
    Key? key,
    required this.fcategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, right: 10.w, left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Icon(Icons.arrow_back_ios,   color: AppColors.Icon1Color,)),
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
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CoursesDetails(factor:factor),

                  //   ),
                  // );
                },
                child: Container(
                  height: 500.h,
                  child: FutureBuilder<List<FCModel>>(
                    future: FeaturedService().getAllFCategry(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<FCModel> fcategory = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: (fcategory.length / 2).ceil(),
                          itemBuilder: (context, rowIndex) {
                            final factor = fcategory[rowIndex];
                            int startIndex = rowIndex * 2;
                            int endIndex = (rowIndex + 1) * 2;

                            endIndex = endIndex > fcategory.length
                                ? fcategory.length
                                : endIndex;

                            return Row(
                              children:
                                  List.generate(endIndex - startIndex, (index) {
                                return CustomCard(
                                  fcategory: fcategory[startIndex + index],
                                );
                              }),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
