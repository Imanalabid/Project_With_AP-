// import 'package:Taallam/generated/l10n.dart';
// import 'package:Taallam/screens/home/Categories/widgets/CategoriesWidget.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import '../../../config/Config.dart';
// import '../../../models/CategoryCorModel.dart';
// import '../../../models/slider.dart';
// import '../../../services/slider.dart';
// import '../FeaturedCourses/widgets/FeaturedCoursesWidget.dart';
// import 'popularCoursesWidget.dart';

// class TestListview extends StatefulWidget {
//   TestListview({Key? key, required this.sliderModel}) : super(key: key);
//   final List<SliderModel> sliderModel;

//   @override
//   State<TestListview> createState() => _TestListviewState(sliderModel: []);
// }

// class _TestListviewState extends State<TestListview> {
//   late String userEmail;
//   final List<SliderModel> sliderModel;

//   _TestListviewState({required this.sliderModel});

//   @override
//   void initState() {
//     super.initState();

//     userEmail = Get.arguments?['email'] ?? '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.backgroundColor,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 30.h,
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(right: 15.w),
//                 child: Container(
//                   height: 40.h,
//                   width: 40.w,
//                   child: Icon(Icons.person),
//                   decoration: BoxDecoration(
//                       color: AppColors.containerColor,
//                       borderRadius: BorderRadius.circular(30.r)),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.01,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'مرحباً بك ',
//                     style: theme.textTheme.bodyText1?.copyWith(
//                       fontFamily: isArabic() ? 'Cairo' : 'aloevera',
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.003,
//                   ),
//                   Text(
//                     userEmail,
//                     style: theme.textTheme.bodyText1?.copyWith(
//                         fontFamily: isArabic() ? 'Cairo' : 'aloevera',
//                         fontSize: 9.sp,
//                         fontWeight: FontWeight.w100),
//                   ),
//                 ],
//               ),
//               Spacer(),
//               Padding(
//                 padding: EdgeInsets.only(left: 15.w),
//                 child: Container(height: 70.h, child: LogoImage.logoImage),
//               )
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.01,
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 StreamBuilder<SliderModel>(
//   stream: sliderModel.image, // تعيين الـ Stream المتواجد في SliderModel
//   builder: (BuildContext context, AsyncSnapshot<SliderModel> snapshot) {
//     if (snapshot.hasData) {
//       SliderModel sliderModel = snapshot.data;
//       return Image.network(
//         sliderModel.image,
//         fit: BoxFit.cover,
//       );
//     } else if (snapshot.hasError) {
//       return Text('حدث خطأ في جلب البيانات');
//     } else {
//       return CircularProgressIndicator();
//     }
//   },
// ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.03,
//                 ),

//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: isArabic() ? 20.w : 10.w,
//                       right: isArabic() ? 20.w : 20.w),
//                   child: Row(
//                     children: [
//                       Text(
//                         S.of(context).category,
//                         style: theme.textTheme.bodyText1?.copyWith(
//                             fontFamily: isArabic() ? 'Cairo' : 'aloevera',
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.01,
//                 ),

//                 // Categoryyyyyyy
//                 SizedBox(
//                   height: 130.h,
//                   child: CategoryCor(),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.03,
//                 ),

//                 // Featuerd Courses
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: isArabic() ? 20.w : 10.w,
//                           right: isArabic() ? 25.w : 20.w),
//                       child: Text(
//                         S.of(context).featured_courses,
//                         style: theme.textTheme.bodyText1?.copyWith(
//                             fontFamily: isArabic() ? 'Cairo' : 'aloevera',
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.toNamed('/FeaturedCourses');
//                       },
//                       child: Container(
//                         child: Row(
//                           children: [
//                             Text(S.of(context).view_all,
//                                 style: theme.textTheme.bodyText1?.copyWith(
//                                   fontSize: 12.sp,
//                                   fontFamily: isArabic() ? 'Cairo' : 'aloevera',
//                                   fontWeight: FontWeight.w600,
//                                 )),
//                             Icon(
//                               Icons.arrow_right,
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.01,
//                 ),

//                 SizedBox(
//                   height: 140.h,
//                   child: FeaturedCor(),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.03,
//                 ),
//                 //Popularrrr Courses
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: isArabic() ? 25.w : 10.w,
//                           right: isArabic() ? 20.w : 20.w),
//                       child: Text(
//                         S.of(context).featured,
//                         style: theme.textTheme.bodyText1?.copyWith(
//                             fontFamily: isArabic() ? 'Cairo' : 'aloevera',
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.toNamed('/FeaturedCourses');
//                       },
//                       child: Container(
//                         child: Row(
//                           children: [
//                             Text(S.of(context).view_all,
//                                 style: theme.textTheme.bodyText1?.copyWith(
//                                   fontFamily: isArabic() ? 'Cairo' : 'aloevera',
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w600,
//                                 )),
//                             Icon(
//                               Icons.arrow_right,
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 150.h,
//                   width: 330.w,
//                   child: PopularCor(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSlider(List<SliderModel> sliderData) {
//     return CarouselSlider.builder(
//       itemCount: sliderData.length,
//       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//         String imageUrl = sliderData[itemIndex].image;

//         if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
//           imageUrl = '${ApiVariables.BASE_URL}/uploads/$imageUrl';
//           print(imageUrl);
//         }

//         return Container(
//           width: MediaQuery.of(context).size.width,
//           margin: EdgeInsets.symmetric(horizontal: 0),
//           decoration: BoxDecoration(
//             borderRadius:
//                 BorderRadius.circular(10.0), // Adjust the border radius
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3), // Adjust the shadow offset
//               ),
//             ],
//           ),
//           child: Image.network(
//             imageUrl,
//             fit: BoxFit.cover, // Adjust the fit as per your requirement
//           ),
//         );
//       },
//       options: CarouselOptions(
//         height: 300.h,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.85, // Adjust the visible portion of the item
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         enlargeFactor: 1, // Adjust the size of the centered item
//         onPageChanged: ((index, reason) => {}),
//         scrollDirection: Axis.horizontal,
//       ),
//     );
//   }
// }

// bool isArabic() {
//   return Intl.getCurrentLocale() == 'ar';

//   // left: isArabic?0:16
// }

// class MySearchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = '';
//           }
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back_ios),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final List<CourseModel> searchResults = _getSearchResults(query);

//     return ListView.builder(
//       itemCount: searchResults.length,
//       itemBuilder: (context, index) {
//         final result = searchResults[index];
//         return ListTile(
//           title: Text(result
//               .name), // Replace with the actual property of your CourseModel
//           onTap: () {
//             // Handle tapping on a search result, for example, navigate to a details page
//             Navigator.pushNamed(context, '/ItemDetailsPage', arguments: result);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final List<CourseModel> suggestions =
//         []; // Replace with your list of suggestions
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestion = suggestions[index];
//         return ListTile(
//           title: Text(suggestion
//               .name), // Replace with the actual property of your CourseModel
//           onTap: () {
//             query = suggestion
//                 .name; // Replace with the actual property of your CourseModel
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }

// List<CourseModel> _getSearchResults(String query) {
//   // Replace this with your logic to fetch search results based on the entered query
//   // For example, you can filter a list of all courses based on the query
//   final List<CourseModel> allCourses = []; // Replace with your list of courses

//   // Print the content of allCourses before filtering
//   print("All Courses: $allCourses");

//   // Filter courses based on the query
//   final List<CourseModel> searchResults =
//       allCourses.where((course) => course.name.contains(query)).toList();

//   // Print the content of searchResults
//   print("Search Results: $searchResults");

//   // Return the filtered results
//   return searchResults;
// }
