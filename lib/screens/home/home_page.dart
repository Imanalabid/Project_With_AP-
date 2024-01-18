import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../config/Config.dart';
import '../../generated/l10n.dart';
import '../../models/CategoryCorModel.dart';
import '../../models/slider.dart';
import '../../services/slider.dart';
import '../profile/search.dart';
import 'Categories/widgets/CategoriesWidget.dart';
import 'Widgets/TopCatWidget.dart';
import 'FeaturedCourses/widgets/FeaturedCoursesWidget.dart';
import 'Widgets/popularCoursesWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.sliderModel}) : super(key: key);
  final List<SliderModel> sliderModel;

  @override
  State<HomePage> createState() => _HomePageState(sliderModel: []);
}

class _HomePageState extends State<HomePage> {
  late String userEmail;
  final List<SliderModel> sliderModel;

  _HomePageState({required this.sliderModel});

  @override
  void initState() {
    super.initState();

    userEmail = Get.arguments?['email'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  child: Icon(Icons.person),
                  decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(30.r)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحباً بك ',
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003,
                  ),
                  Text(
                    userEmail,
                    style: theme.textTheme.bodyText1?.copyWith(
                        fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Container(height: 70.h, child: LogoImage.logoImage),
              )
            ],
          ),

          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 110.h,
                  child: FutureBuilder<List<SliderModel>>(
                    future: SliderService().getAllSlider(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<SliderModel> sliderData = snapshot.data!;
                        if (sliderData.isNotEmpty) {
                          return _buildSlider(sliderData);
                        } else {
                          return Center(
                              child: Text('No slider items available.'));
                        }
                      } else if (snapshot.hasError) {
                        // Handle the error case
                        return Center(
                            child: Text('Error loading slider data.'));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: isArabic() ? 20.w : 10.w,
                      right: isArabic() ? 20.w : 20.w),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).category,
                        style: theme.textTheme.bodyText1?.copyWith(
                            fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Categoryyyyyyy
                SizedBox(
                  height: 130.h,
                  child: CategoryCor(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                // Featuerd Courses
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: isArabic() ? 20.w : 10.w,
                          right: isArabic() ? 25.w : 20.w),
                      child: Text(
                        S.of(context).featured_courses,
                        style: theme.textTheme.bodyText1?.copyWith(
                            fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/FeaturedCourses');
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text(S.of(context).view_all,
                                style: theme.textTheme.bodyText1?.copyWith(
                                  fontSize: 12.sp,
                                  fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                                  fontWeight: FontWeight.w600,
                                )),
                            Icon(
                              Icons.arrow_right,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                SizedBox(
                  height: 140.h,
                  child: FeaturedCor(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //Popularrrr Courses
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: isArabic() ? 25.w : 10.w,
                          right: isArabic() ? 20.w : 20.w),
                      child: Text(
                        S.of(context).featured,
                        style: theme.textTheme.bodyText1?.copyWith(
                            fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/FeaturedCourses');
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text(S.of(context).view_all,
                                style: theme.textTheme.bodyText1?.copyWith(
                                  fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                            Icon(
                              Icons.arrow_right,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150.h,
                  width: 330.w,
                  child: PopularCor(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(List<SliderModel> sliderData) {
    return CarouselSlider.builder(
      itemCount: sliderData.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        String imageUrl = sliderData[itemIndex].image;

        if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
          imageUrl = '${ApiVariables.BASE_URL}/uploads/$imageUrl';
          print(imageUrl);
        }

        return Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(5.0), // Set the border radius to 0
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain, // Adjust the fit as per your requirement
          ),
        );
      },
      options: CarouselOptions(
        height: 300.h,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0, // Set to 1.0 to display the image full width
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true, // Disable autoPlay
        enlargeCenterPage: true,
        onPageChanged: ((index, reason) => {}),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';

  // left: isArabic?0:16
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<CourseModel> searchResults = _getSearchResults(query);

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final result = searchResults[index];
        return ListTile(
          title: Text(result
              .name), // Replace with the actual property of your CourseModel
          onTap: () {
            // Handle tapping on a search result, for example, navigate to a details page
            Navigator.pushNamed(context, '/ItemDetailsPage', arguments: result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<CourseModel> suggestions =
        []; // Replace with your list of suggestions
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion
              .name), // Replace with the actual property of your CourseModel
          onTap: () {
            query = suggestion
                .name; // Replace with the actual property of your CourseModel
            showResults(context);
          },
        );
      },
    );
  }
}

List<CourseModel> _getSearchResults(String query) {
  // Replace this with your logic to fetch search results based on the entered query
  // For example, you can filter a list of all courses based on the query
  final List<CourseModel> allCourses = []; // Replace with your list of courses

  // Print the content of allCourses before filtering
  print("All Courses: $allCourses");

  // Filter courses based on the query
  final List<CourseModel> searchResults =
      allCourses.where((course) => course.name.contains(query)).toList();

  // Print the content of searchResults
  print("Search Results: $searchResults");

  // Return the filtered results
  return searchResults;
}
