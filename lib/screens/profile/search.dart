import 'package:Taallam/services/recent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../config/Config.dart';
import '../../models/recent_model.dart';
import '../Course/CoursesDetails/widgets/dropdown.dart';
import '../home/home_page.dart';

class SearchScreen extends StatelessWidget {
  final List<RecentModel> recentCourses;

  const SearchScreen({Key? key, required this.recentCourses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> searchData = [];
    TextEditingController _searchController = TextEditingController();

    void fetchSearchData(String query) async {
      try {
        final response = await http.get(Uri.parse(
            '${ApiVariables.BASE_URL}/home/search_api?keyword=$query'));

        if (response.statusCode == 200) {
          searchData = json.decode(response.body);
        } else {
          print('Error: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, right: 10.w, left: 10.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Container(height: 70.h, child: LogoImage.logoImage),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: 40.h,
              width: 320.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(15.r),
                color: theme.cardColor.withOpacity(0.4),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      size: 25,
                    ),
                    Expanded(
                      child: TypeAheadField(
                        controller: _searchController,
                        suggestionsCallback: (pattern) async {
                          final response = await http.get(Uri.parse(
                              '${ApiVariables.BASE_URL}/home/search_api?keyword=$pattern'));
                          if (response.statusCode == 200) {
                            final data = json.decode(response.body);
                            return data;
                          } else {
                            return [];
                          }
                        },
                        itemBuilder: (context, dynamic suggestion) {
                          final String? title = suggestion?['id'];
                          final String? description = suggestion?['name'];
                          return ListTile(
                            leading: SizedBox(
                              width: 48.0,
                              height: 48.0,
                              child: Image.network(
                                "${ApiVariables.imageConfig}/${suggestion?['image']}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(title ?? ''),
                            subtitle: Text(description ?? ''),
                          );
                        },
                        onSelected: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: SizedBox(
                        width: 48.0,
                        height: 48.0,
                        child: Image.network(
                          "${ApiVariables.imageConfig}/${searchData[index]['image']}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(searchData[index]['id']),
                      subtitle: Text(searchData[index]['name']),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        'الدورات المقترحة',
                        style: theme.textTheme.bodyText1?.copyWith(
                          fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CoursesDetails(factor:factor),

                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      child: SingleChildScrollView(
                        child: Container(
                          height: 400.h,
                          child: FutureBuilder<List<RecentModel>>(
                            future: RecentService().getAllRecent(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<RecentModel> recentModel = snapshot.data!;
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: (recentModel.length / 2).ceil(),
                                  itemBuilder: (context, rowIndex) {
                                    final recent = recentModel[rowIndex];
                                    int startIndex = rowIndex * 2;
                                    int endIndex = (rowIndex + 1) * 2;

                                    endIndex = endIndex > recentModel.length
                                        ? recentModel.length
                                        : endIndex;

                                    return Row(
                                      children: List.generate(
                                          endIndex - startIndex, (index) {
                                        return CustomCard1(
                                          recentCourses:
                                              recentModel[startIndex + index],
                                        );
                                      }),
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard1 extends StatelessWidget {
  CustomCard1({
    super.key,
    required this.recentCourses,
  });
  final RecentModel recentCourses;

  @override
  Widget build(BuildContext context) {
    String imageUrl = recentCourses.image;
    final ThemeData theme = Theme.of(context);

    if (!imageUrl.startsWith('http') && !imageUrl.startsWith('https')) {
      imageUrl = '${ApiVariables.BASE_URL}/uploads/$imageUrl';
      print(imageUrl);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DropdownPage(
              courseID: recentCourses.id,
              video: '',
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
        height: 150.h,
        width: 140.w,
        decoration: BoxDecoration(
          color: theme.cardColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Text(recentCourses.name,
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: SingleChildScrollView(
                child: Text(recentCourses.details,
                    style: TextStyle(
                      color: AppColors.smalltextfontColor,
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
