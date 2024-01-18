import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taallam/models/FeaturedCoursesmodel.dart';
import 'package:Taallam/screens/home/FeaturedCourses/widgets/Costumcard.dart';

import '../../../services/get_FeaturedCourses.dart';
import '../../home/home_page.dart';

class Tabbar extends StatelessWidget {
  Tabbar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Tab(
                  child: Text(
                    'Review',
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 10.w, left: 10.w, top: 20.h),
                    child: Text(
                      "هذا الكورس موجه لجميع طلاب الهندسات في مختلف الكليات في أنحاء العالم .. وهو موجه للطلاب الذين يدرسون في الجامعات التركية أو الجامعات التي تدرس باللغة الانكليزية أو الألمانية</p><p dir=\"rtl\">في هذا الكورس سنشرح مادة الديناميك بالتفصيل الممل مروراً بالحركة المستقيمة المنتظمة والحركة المستقيمة المتغيرة بانتظام والحركة الدائرية المنتظمة والحركة الدائرية المتغيرة بانتظام كما سنشرح بالتفصيل الحركة المنحنية</p><p dir=\"rtl\">سنشرح مفاهيم الكيناميتك Kinematik للحركة من حيث شرح المفاهيم الهندسية للحركة وهي الإازحة والسرعة والتسارع والزومن وكيفية اشتقاق العلاققات فيما بينهم</p><p dir=\"rtl\">كما سنتعامل مع المخططات وكيفية رسم الجوانب الهندسية للحركة للإزاحة والسرعة والتسارع</p><p dir=\"rtl\">سنناقش قانون نيوتن الثاني وهو مجموع القوى المؤثرة على جسم تساوي جداء كتلته في تسارعه<br></p><p dir=\"rtl\">سنقوم بحل العديد من المسائل على مماسبق من حيث اشتقاق المسافة والسرعة أو من حيث تكامل السرعة والتسارع أيضاً سنقوم بحل مسائل على رسم المخططات وكيفية الاستفادة منها للح",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                          fontWeight: FontWeight.w400),
                    ),
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
