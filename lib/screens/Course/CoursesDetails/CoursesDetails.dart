import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CoursesDetails extends StatelessWidget {
  const CoursesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text('Colorssssssssssss')]),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project1/screens/Course/CoursesDetails/widgets/course_costum_card.dart';
//
// import '../../../models/fCourses_model.dart';
// import '../../../services/get_CoursesDetails.dart';
// import '../../home/FeaturedCourses/widgets/Costumcard.dart';
//
// class CoursesDetails extends StatelessWidget {
//   const CoursesDetails({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//             padding: EdgeInsets.only(top: 30.h, right: 10.w, left: 10.w),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.03,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                       height: 90,
//                       width: 150,
//                       child: Image.asset(
//                         "assets/img/OSUSlogo.png",
//                       )),
//                 ],
//               ),
//               Container(
//                 height: 40.h,
//                 width: 325.w,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 0.w, right: 5.w),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.search,
//                         color: Colors.grey,
//                         size: 28,
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.005,
//                       ),
//                       Text(
//                         'What you want to learn ?',
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontFamily: 'Manrope',
//                             fontSize: 12.sp),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.35,
//                       ),
//                       Icon(Icons.menu_sharp)
//                     ],
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.r),
//                   border: Border.all(color: Colors.grey.shade300),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.03,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   //   Navigator.pushNamed(context, '/ProgCourses');
//                 },
//                 child: Container(
//                   height: 500.h,
//                   child: FutureBuilder<List<fCoursesModel>>(
//                     future: FeaturedCoursesService().getAllFCoursesCategry(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         List<fCoursesModel> fcoursescategory = snapshot.data!;
//                         return ListView.builder(
//                           scrollDirection: Axis.vertical,
//                           itemCount: (fcoursescategory.length / 2).ceil(),
//                           itemBuilder: (context, rowIndex) {
//                             int startIndex = rowIndex * 2;
//                             int endIndex = (rowIndex + 1) * 2;
//
//                             endIndex = endIndex > fcoursescategory.length
//                                 ? fcoursescategory.length
//                                 : endIndex;
//
//                             return Row(
//                               children:
//                                   List.generate(endIndex - startIndex, (index) {
//                                 return FCustomCard(
//                                   fcoursescategory:
//                                       fcoursescategory[startIndex + index],
//                                 );
//                               }),
//                             );
//                           },
//                         );
//                       } else {
//                         return Center(child: CircularProgressIndicator());
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ])));
//   }
// }
