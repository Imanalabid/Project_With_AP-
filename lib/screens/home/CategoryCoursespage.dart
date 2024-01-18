import 'package:Taallam/screens/home/Coursespage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/Config.dart';
import '../../controller/homescreenController.dart';
import '../../generated/l10n.dart';
import '../../models/CategoryCorModel.dart';
import 'package:Taallam/models/CategoryCorModel.dart' as CategoryCor;
import 'package:Taallam/models/lessonModel.dart' as Lesson;
import '../Course/CoursePage.dart';
import '../Course/CoursesDetails/widgets/dropdown.dart';
import '../Course/newCoursesPage.dart';
import '../profile/search.dart';
import 'home_page.dart';

// صفحة الكورسسسسات
class SecondScreen extends StatefulWidget {
  final List<CourseModel> categoryCorModel;
  SecondScreen({
    Key? key,
    required this.categoryCorModel,
  }) : super(key: key);
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    print(
        'Category Cor Model List Length: ${widget.categoryCorModel.first.details}');
    final ThemeData theme = Theme.of(context);

    String imageUrl = widget.categoryCorModel.first.image;
    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = '${ApiVariables.imageConfig}/$imageUrl';
      print(imageUrl);
    }

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    child: Container(height: 70.h, child: LogoImage.logoImage),
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
                          style: theme.textTheme.bodyText1?.copyWith(
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
                    color: theme.cardColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
              ],
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

                  //   print(imageUrl);
                  // }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DropdownPage(
                            courseID: widget.categoryCorModel[index].id,
                            video:
                                '${ApiVariables.VideoConfig}/170170102445494808.mp4',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.network(
                              imageUrl,
                              width: 180.w,
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Flexible(
                                child: Center(
                                  child: Text(
                                    widget.categoryCorModel[index].name,
                                    style: theme.textTheme.bodyText1?.copyWith(
                                      fontFamily:
                                          isArabic() ? 'Cairo' : 'aloevera',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: theme.cardColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12.r),
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
