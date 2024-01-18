import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/Config.dart';
import '../../../../models/FeaturedCoursesmodel.dart';
import '../../../../services/get_FeaturedCourses.dart';
import '../../../Course/CoursesDetails/widgets/dropdown.dart';
import '../../../Course/newCoursesPage.dart';
import 'FCard.dart';

class FeaturedCor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FCModel>>(
        future: FeaturedService().getAllFCategry(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FCModel> fcategory = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fcategory.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => DropdownPage(
                  //        //   courseID:categoryCorModel[index].id,
                  //         video:
                  //             '${ApiVariables.VideoConfig}/170170102445494808.mp4',
                  //       ),
                  //     ),
                  //   );
                  // },
                  child: FCont(
                    fcategory: fcategory[index],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
