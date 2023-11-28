import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../config/Config.dart';
import '../../generated/l10n.dart';
import '../../models/CategoryCorModel.dart';
import 'Categories/widgets/CategoriesWidget.dart';
import 'Widgets/TopCatWidget.dart';

import 'FeaturedCourses/widgets/FeaturedCoursesWidget.dart';
import 'Widgets/popularCoursesWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  bool isSearchContainerVisible = false;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, right: 10.w, left: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  LogoImage.logoImage,
                  Spacer(),


                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSearchContainerVisible = !isSearchContainerVisible;
                      });
                    },
                    child: Icon(
                      Icons.search,
                      color: AppColors.Icon1Color,
                      size: 28,
                    ),
                  ),
                  Visibility(
                    visible: isSearchContainerVisible,
                    child: Container(
                      height: 40,
                      width: 250,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: isArabic() ? 20 : 10,
                          right: isArabic() ? 10 : 10,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.005,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onChanged: (query) {
                                  setState(() {
                                    _searchQuery = query;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: S.of(context).what_you_want_to_learn,
                                  hintStyle: TextStyle(
                                    color: AppColors.smalltextfontColor,
                                    fontFamily: 'Manrope',
                                    fontSize: 12,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),





              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding:  EdgeInsets.only(
                  left: isArabic()? 20.w:10.w,
                  right: isArabic()?20.w:20.w
                ),
                child: Row(
                  children: [
                    Text(
                      S.of(context).category,
                      style: TextStyle(
                          color: AppColors.mainfontColor,
                          fontFamily: 'Manrope',
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
                height: 150.h,
                child: CategoryCor(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(
                        left: isArabic()? 20.w:10.w,
                        right: isArabic()?25.w:20.w
                    ),
                    child: Text(
                      S.of(context).featured_courses,
                      style: TextStyle(
                          color: AppColors.mainfontColor,
                          fontSize: 20.sp,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/FeaturedCourses');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(S.of(context).view_all,
                              style: TextStyle(
                                color: AppColors.secoundfontColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(
                            Icons.arrow_right,
                            color: AppColors.Icon1Color,
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

              // Featuerd Courses
              SizedBox(
                height: 150.h,
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
                    padding:  EdgeInsets.only(
                        left: isArabic()? 25.w:10.w,
                        right: isArabic()?20.w:20.w
                    ),
                    child: Text(
                      S.of(context).featured,
                      style: TextStyle(
                          color: AppColors.mainfontColor,
                          fontSize: 20.sp,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/PopularCourses');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(S.of(context).view_all,
                              style: TextStyle(
                                color: AppColors.secoundfontColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(
                            Icons.arrow_right,
                            color: AppColors.Icon1Color,
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
      ),
    );
  }
}
bool isArabic(){
  return Intl.getCurrentLocale()=='ar';

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
    final List<CourseModel> searchResults = _getSearchResults(query); // Replace with your logic to get search results

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final result = searchResults[index];
        return ListTile(
          title: Text(result.title), // Replace with the actual property of your CourseModel
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
    final List<CourseModel> suggestions = []; // Replace with your list of suggestions
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.title), // Replace with the actual property of your CourseModel
          onTap: () {
            query = suggestion.title; // Replace with the actual property of your CourseModel
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
  final List<CourseModel> searchResults = allCourses.where((course) => course.title.contains(query)).toList();

  // Print the content of searchResults
  print("Search Results: $searchResults");

  // Return the filtered results
  return searchResults;
}

