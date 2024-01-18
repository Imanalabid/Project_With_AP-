import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/Config.dart';
import '../../../../models/FeaturedCoursesmodel.dart';
import '../../../Course/CoursesDetails/widgets/dropdown.dart';
import '../../home_page.dart';

class FCont extends StatelessWidget {
  FCont({required this.fcategory});

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
        margin: EdgeInsets.only(right: 10.w),
        width: 140.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  imageUrl,
                  width: 140.w,
                  height: 75.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return Container();
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Text(
                  fcategory.name,
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: theme.cardColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
