import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/FeaturedCoursesmodel.dart';
import '../../../config/Config.dart';
import '../../Course/CoursesDetails/widgets/dropdown.dart';
import '../home_page.dart';

class PCont extends StatelessWidget {
  PCont({required this.pcategory});

  final FCModel pcategory;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    String imageUrl = pcategory.image;
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
              courseID: pcategory.id,
              video: '${ApiVariables.VideoConfig}/170170102445494808.mp4',
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
                imageUrl,
                width: 90.w,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 8.w, bottom: 8.h, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pcategory.name,
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                      fontSize: 15.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    pcategory.courseType,
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                      fontSize: 12.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
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
