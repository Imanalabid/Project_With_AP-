import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taallam/models/FeaturedCoursesmodel.dart';
import 'package:Taallam/screens/home/FeaturedCourses/widgets/Costumcard.dart';

import '../../../config/Config.dart';
import '../../../services/get_FeaturedCourses.dart';
import '../../models/recent_model.dart';
import '../../services/recent.dart';
import '../home/home_page.dart';

class RecentCourses extends StatelessWidget {
  final List<RecentModel> recentCourses;

  RecentCourses({
    Key? key,
    required this.recentCourses,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.Icon1Color,
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
                            fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                      Icon(
                        Icons.menu_sharp,
                        color: AppColors.Icon1Color,
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
                  child: FutureBuilder<List<RecentModel>>(
                    future: RecentService().getAllRecent(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<RecentModel> recentModel = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: (recentModel.length / 2).ceil(),
                          itemBuilder: (context, rowIndex) {
                            final factor = recentModel[rowIndex];
                            int startIndex = rowIndex * 2;
                            int endIndex = (rowIndex + 1) * 2;

                            endIndex = endIndex > recentModel.length
                                ? recentModel.length
                                : endIndex;

                            return Row(
                              children:
                                  List.generate(endIndex - startIndex, (index) {
                                return CustomCard1(
                                  recentCourses:
                                      recentModel[startIndex + index],
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

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
    super.key,
    required this.recentCourses,
  });
  final RecentModel recentCourses;

  @override
  Widget build(BuildContext context) {
    String imageUrl = recentCourses.image;
    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = '${ApiVariables.BASE_URL}/uploads/$imageUrl';
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
            child: Text(recentCourses.name,
                style: TextStyle(
                  color: AppColors.secoundfontColor,
                  fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: SingleChildScrollView(
              child: Text(recentCourses.shortDetails,
                  style: TextStyle(
                    color: AppColors.smalltextfontColor,
                    fontFamily: isArabic() ? 'Cairo' : 'aloevera',
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
