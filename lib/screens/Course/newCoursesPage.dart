// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:video_player/video_player.dart';
// //
// // import '../../config/Config.dart';
// // import '../../models/coursemodel.dart' as CourseModel;
// // import '../../models/lessonModel.dart' as LessonModel;
// // import '../../services/get_all_courses.dart';
// // import '../home/videoPage.dart';
// // import 'CoursesDetails/widgets/dropdown.dart';
// //
// // class Country {
// //   final String name;
// //   final List<String> cities;
// //
// //   Country({required this.name, required this.cities});
// // }
// //
// // class City {
// //   final String name;
// //
// //   City({required this.name});
// // }
// //
// // class NCoursesPage extends StatefulWidget {
// //   final int containerIndex;
// //   final String videoUrl;
// //   final List<LessonModel.Lesson> lessonModel;
// //   final List<CourseModel.Course> courseModel;
// //
// //   NCoursesPage({
// //     Key? key,
// //     required this.containerIndex,
// //     required this.lessonModel,
// //     required this.courseModel,
// //     required this.videoUrl,
// //   }) : super(key: key);
// //
// //   @override
// //   _NCoursesPageState createState() => _NCoursesPageState();
// // }
// //
// // class _NCoursesPageState extends State<NCoursesPage> {
// //   List<Country> countries = [
// //     Country(
// //       name: 'Country 1',
// //       cities: ['City 1', 'City 2', 'City 3'],
// //     ),
// //     Country(
// //       name: 'Country 2',
// //       cities: ['City 4', 'City 5', 'City 6'],
// //     ),
// //     // Add more countries...
// //   ];
// //
// //   late VideoPlayerController _controller;
// //   late Future<void> _initializeVideoPlayerFuture;
// //
// //   int selectedButtonIndex = 0;
// //   late Future<List<LessonModel.Lesson>> lessonModelFuture;
// //   late Future<List<LessonModel.Course>> courseModelFuture;
// //
// //    // late List<LessonModel.Lesson> lessonModelFuture;
// //  // late List<LessonModel.Course>> courseModelFuture;
// //   Map<String, bool> isDropdownOpenMap = {};
// //   String? selectedCountry;
// //   String? selectedCity;
// //   String? selectedCourse;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerController.network(
// //       widget.videoUrl,
// //     );
// //     _initializeVideoPlayerFuture = _controller.initialize();
// //     _controller.setLooping(true);
// //         getAllCoursesPageOfCategory(widget.containerIndex + 1).then((courses) {
// //       // Convert List<CourseModel.Course> to List<LessonModel.Course>
// //       return courses.map((course) {
// //         return LessonModel.Course(
// //           id: course.id,
// //           name: course.name,
// //           lessons: course.lessons.map((lesson) {
// //             return LessonModel.Lesson(
// //                 id: lesson.id,
// //                 name: lesson.name,
// //                 subjectId: '',
// //                 video: '',
// //                 details: '',
// //                 ordering: '',
// //                 duration: '',
// //                 freePreview: '');
// //           }).toList(),
// //           courseId: '',
// //           ordering: '',
// //         );
// //       }).toList();
// //     });
// //
// //     isDropdownOpenMap = Map.fromIterable(widget.lessonModel,
// //         key: (lesson) => lesson.id, value: (_) => false);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   List<String> _itemsOne = ['Item 1'];
// //   List<String> _itemsTwo = ['Subitem 1', 'Subitem 2', 'Subitem 3'];
// //   String? _selectedItem = 'Item 1';
// //   @override
// //   Widget build(BuildContext context) {
// //     List<String> combinedItems =
// //         _selectedItem == 'Item 1' ? [..._itemsOne, ..._itemsTwo] : _itemsOne;
// //     return Scaffold(
// //       backgroundColor: Colors.grey.shade200,
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 'You tapped on container with index: ${widget.containerIndex}',
// //                 style: TextStyle(fontSize: 18),
// //               ),
// //               Container(
// //                 height: 220.h,
// //                 width: 340.w,
// //                 margin: EdgeInsets.only(bottom: 8.0),
// //                 decoration: BoxDecoration(
// //                   color: AppColors.containerColor,
// //                   borderRadius: BorderRadius.circular(15.r),
// //                 ),
// //                 child: FutureBuilder(
// //                   future: _initializeVideoPlayerFuture,
// //                   builder: (context, snapshot) {
// //                     if (snapshot.connectionState == ConnectionState.done) {
// //                       return AspectRatio(
// //                         aspectRatio: _controller.value.aspectRatio,
// //                         child: VideoPlayer(_controller),
// //                       );
// //                     } else {
// //                       return Center(
// //                         child: CircularProgressIndicator(),
// //                       );
// //                     }
// //                   },
// //                 ),
// //               ),
// //               SizedBox(height: 16.0),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   buildButton(0, 'Course content'),
// //                   buildButton(1, 'Teacher'),
// //                   buildButton(2, 'Review'),
// //                 ],
// //               ),
// //               SizedBox(height: 16.0),
// //               SingleChildScrollView(
// //                 child: Container(
// //                   height: 400.h,
// //                   width: 400.w,
// //                   padding: EdgeInsets.all(8.0),
// //                   decoration: BoxDecoration(
// //                     color: AppColors.containerColor,
// //                     borderRadius: BorderRadius.circular(15.r),
// //                   ),
// //                   child: SingleChildScrollView(
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: List.generate(4, (index) {
// //                         return Container(
// //                           padding: EdgeInsets.symmetric(horizontal: 16),
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(8),
// //                             border: Border.all(color: Colors.grey),
// //                           ),
// //                           child: DropdownButton<String>(
// //                             value: _selectedItem,
// //                             onChanged: (String? newValue) {
// //                               setState(() {
// //                                 _selectedItem = newValue;
// //                               });
// //                             },
// //                             items:combinedItems.map((String item) {
// //                               return DropdownMenuItem<String>(
// //                                 value: item,
// //                                 child: Text(item),
// //                               );
// //                             }).toList(),
// //                           ),
// //                         );
// //                       }),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildButton(int index, String buttonText) {
// //     return ElevatedButton(
// //       onPressed: () {
// //         setState(() {
// //           selectedButtonIndex = index;
// //         });
// //       },
// //       style: ButtonStyle(
// //         backgroundColor: MaterialStateProperty.all(
// //           selectedButtonIndex == index ? Colors.blue.shade700 : Colors.grey,
// //         ),
// //       ),
// //       child: Text(buttonText, style: TextStyle(color: Colors.white)),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:video_player/video_player.dart';

// import '../../config/Config.dart';
// import '../../models/coursemodel.dart' as CourseModel;
// import '../../models/lessonModel.dart' as LessonModel;
// import '../../services/get_all_courses.dart';
// import '../home/videoPage.dart';
// import 'CoursesDetails/widgets/dropdown.dart';

// class Country {
//   final String name;
//   final List<String> cities;

//   Country({required this.name, required this.cities});
// }

// class City {
//   final String name;

//   City({required this.name});
// }

// class NCoursesPage extends StatefulWidget {
//   final int containerIndex;
//   final String videoUrl;
//   final List<LessonModel.Lesson> lessonModel;
//   final List<CourseModel.Course> courseModel;

//   NCoursesPage({
//     Key? key,
//     required this.containerIndex,
//     required this.lessonModel,
//     required this.courseModel,
//     required this.videoUrl,
//   }) : super(key: key);

//   @override
//   _NCoursesPageState createState() => _NCoursesPageState();
// }

// class _NCoursesPageState extends State<NCoursesPage> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   int selectedButtonIndex = 0;
//   late Future<List<LessonModel.Lesson>> lessonModelFuture;
//   late Future<List<LessonModel.Course>> courseModelFuture;

//   Map<String, bool> isDropdownOpenMap = {};
//   String? selectedCountry;
//   String? selectedCity;
//   String? selectedCourse;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       widget.videoUrl,
//     );
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//     // lessonModelFuture = getAllCoursesPageOfCategory(widget.containerIndex + 1);
//     courseModelFuture =
//         getAllCoursesPageOfCategory(widget.containerIndex + 1).then((courses) {
//       // Convert List<CourseModel.Course> to List<LessonModel.Course>
//       return courses.map((course) {
//         return LessonModel.Course(
//           id: course.id,
//           name: course.name,
//           lessons: course.lessons.map((lesson) {
//             return LessonModel.Lesson(
//                 id: lesson.id,
//                 name: lesson.name,
//                 subjectId: '',
//                 video: '',
//                 details: '',
//                 ordering: '',
//                 duration: '',
//                 freePreview: '');
//           }).toList(),
//           courseId: '',
//           ordering: '',
//         );
//       }).toList();
//     });

//     isDropdownOpenMap = Map.fromIterable(widget.lessonModel,
//         key: (lesson) => lesson.id, value: (_) => false);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.backgroundColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'You tapped on container with index: ${widget.containerIndex}',
//                 style: TextStyle(fontSize: 18),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buildButton(0, 'Course content'),
//                   buildButton(1, 'Teacher'),
//                   buildButton(2, 'Review'),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               SingleChildScrollView(
//                 child: Container(
//                   height: 400.h,
//                   width: 400.w,
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: AppColors.containerColor,
//                     borderRadius: BorderRadius.circular(15.r),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(4, (index) {
//                         return Container(
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: Colors.grey),
//                           ),
//                           child: FutureBuilder<List<LessonModel.Course>>(
//                               future: courseModelFuture,
//                               builder: (context, snapshot) {
//                                 print('gggggggggggggggggg ${snapshot.data}');

//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return CircularProgressIndicator();
//                                 } else if (snapshot.hasError) {
//                                   return Text("Error: ${snapshot.error}");
//                                 } else if (!snapshot.hasData ||
//                                     snapshot.data == null) {
//                                   return Text("No courses available");
//                                 } else {
//                                   //copy

//                                   List<LessonModel.Course> courses =
//                                       snapshot.data!;
//                                   return DropdownButton<String>(
//                                     value: selectedCourse,
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         selectedCourse = newValue;
//                                       });
//                                     },
//                                     items: [
//                                       for (var course in courses)
//                                         DropdownMenuItem<String>(
//                                           value: course.name,
//                                           child: Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(course.name,
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               //
//                                               Text(course.lessons.first.name,
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold)),

//                                               // Add more Text widgets or other widgets for additional information
//                                             ],
//                                           ),
//                                         ),
//                                     ],
//                                   );
//                                 }
//                               }),
//                         );
//                       }),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildButton(int index, String buttonText) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           selectedButtonIndex = index;
//         });
//       },
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(
//           selectedButtonIndex == index ? Colors.blue.shade700 : Colors.grey,
//         ),
//       ),
//       child: Text(buttonText, style: TextStyle(color: Colors.white)),
//     );
//   }
// }
