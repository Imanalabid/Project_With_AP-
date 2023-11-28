import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/FeaturedCoursesmodel.dart';
import '../../../../services/get_FeaturedCourses.dart';

import 'Pcard.dart';

class PopularCor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FCModel>>(
        future: FeaturedService().getAllFCategry(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FCModel> pcategory = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: pcategory.length,
              itemBuilder: (context, index) {
                return PCont(
                  pcategory: pcategory[index],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
