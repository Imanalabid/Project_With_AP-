import 'package:Taallam/config/Config.dart';
import 'package:Taallam/main.dart';
import 'package:Taallam/screens/Course/CoursesDetails/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/userCourses_Model.dart';
import '../screens/home/home_page.dart';
import '../services/UserCourses.dart';

class MyCourses extends StatelessWidget {
  MyCourses({Key? key, required this.userCoursesModel, required this.token});
  final List<UserCoursesModel> userCoursesModel;
  final String token;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    //print(prefs.getInt('token'));
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Container(height: 70.h, child: LogoImage.logoImage),
                )
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
                  'دروسي',
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                    fontSize: 18.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: 190.h,
              width: double.infinity,
              //  color: Colors.red,

              child: FutureBuilder<List<UserCoursesModel>>(
                future: UserCoursesService()
                    .getAllUserCourses("${prefs.getInt('token')}"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<UserCoursesModel> userCoursesList = snapshot.data!;

                    return ListView.builder(
                      itemCount: userCoursesList.length,
                      itemBuilder: (context, index) {
                        UserCoursesModel userCourse = userCoursesList[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DropdownPage(
                                  courseID: userCourse.id,
                                  video:
                                      '${ApiVariables.VideoConfig}/170170102445494808.mp4',
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            height: 65.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.network(
                                    'https://taallam-platform.com/uploads/${userCoursesList.first.image}',
                                    width: 90.w,
                                    height: 120.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.w,
                                      bottom: 8.h,
                                      right: 15,
                                      left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userCourse.name,
                                        style:
                                            theme.textTheme.bodyText1?.copyWith(
                                          fontFamily:
                                              isArabic() ? 'Cairo' : 'aloevera',
                                          fontSize: 15.sp,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: theme.cardColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    print('Error fetching data: ${snapshot.error}');
                    return Center(
                      child: Text('Error fetching data'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
