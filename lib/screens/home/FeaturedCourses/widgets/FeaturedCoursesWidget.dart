import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/FeaturedCoursesmodel.dart';
import '../../../../services/get_FeaturedCourses.dart';
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
                return FCont(
                  fcategory: fcategory[index],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
