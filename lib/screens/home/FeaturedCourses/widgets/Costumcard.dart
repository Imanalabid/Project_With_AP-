import 'package:Taallam/models/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/Config.dart';
import '../../../../models/FeaturedCoursesmodel.dart';
import '../../../Course/CoursesDetails/widgets/dropdown.dart';
import '../../home_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.fcategory,
  });
  final FCModel fcategory;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    String imageUrl = fcategory.image;
    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = '${ApiVariables.imageConfig}/$imageUrl';
      print(imageUrl);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DropdownPage(
              courseID: fcategory.id,
              video: '${ApiVariables.VideoConfig}/170170102445494808.mp4',
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
        height: 130.h,
        width: 145.w,
        decoration: BoxDecoration(
          color: theme.cardColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.r),
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
              child: Text(fcategory.name,
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: SingleChildScrollView(
                child: Text(fcategory.shortDetails,
                    style: theme.textTheme.bodyText2?.copyWith(
                      fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
