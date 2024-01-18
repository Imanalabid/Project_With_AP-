import 'package:Taallam/screens/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taallam/models/FeaturedCoursesmodel.dart';
import 'package:Taallam/screens/home/FeaturedCourses/widgets/Costumcard.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../../generated/l10n.dart';
import '../../../services/get_FeaturedCourses.dart';
import '../../Course/CoursesDetails/CoursesDetails.dart';
import '../../profile/search.dart';

class FCourses extends StatelessWidget {
  final List<FCModel> fcategory;

  FCourses({
    Key? key,
    required this.fcategory,
  });

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

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
                padding: EdgeInsets.only(
                  right: 15.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed('/home');
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: theme.cardColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child:
                          Container(height: 70.h, child: LogoImage.logoImage),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 325.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
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
                            S.of(context).what_you_want_to_learn,
                            style: theme.textTheme.bodyText2?.copyWith(
                                fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.containerColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                ],
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
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 0.w),
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
                                children: List.generate(endIndex - startIndex,
                                    (index) {
                                  final int currentIndex = startIndex + index;
                                  if (currentIndex < fcategory.length) {
                                    return CustomCard(
                                      fcategory: fcategory[currentIndex],
                                    );
                                  } else {
                                    return Container(); // or any other widget for cases where the index is out of range
                                  }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
