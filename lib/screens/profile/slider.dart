// import 'package:flutter/material.dart';
// import 'package:Taallam/config/Config.dart';
// import 'package:Taallam/services/slider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../models/slider.dart';

// class SliderPage extends StatelessWidget {
//   SliderPage({super.key, required this.sliderModel});
//   List<SliderModel> sliderModel;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           FutureBuilder<List<SliderModel>>(
//             future: SliderService().getAllSlider(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 List<SliderModel> sliderData = snapshot.data!;
//                 if (sliderData.isNotEmpty) {
//                   return _buildSlider(sliderData);
//                 } else {
//                   // Handle the case when the list is empty
//                   return Center(child: Text('No slider items available.'));
//                 }
//               } else if (snapshot.hasError) {
//                 // Handle the error case
//                 return Center(child: Text('Error loading slider data.'));
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSlider(List<SliderModel> sliderData) {
//     String imageUrl = sliderData.first.image;

//     if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
//       imageUrl = '${ApiVariables.BASE_URL}/uploads/$imageUrl';
//       print(imageUrl);
//     }

//     return CarouselSlider.builder(
//       itemCount: sliderData.length,
//       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
//           Container(
//         child: Image.network(
//           imageUrl,
//         ),
//       ),
//       options: CarouselOptions(
//         height: 300.h,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         enlargeFactor: 0.3,
//         onPageChanged: ((index, reason) => {}),
//         scrollDirection: Axis.horizontal,
//       ),
//     );
//   }
// }
