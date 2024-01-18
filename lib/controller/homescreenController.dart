import 'package:Taallam/Courses/myCourses.dart';
import 'package:Taallam/screens/home/home_page.dart';
import 'package:Taallam/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home/CategoryCoursespage.dart';
import '../screens/profile/search.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  late List<Widget> listPage;
  Rx<FloatingActionButton> floatingActionButton = FloatingActionButton.small(
    backgroundColor: Colors.blue,
    onPressed: () {},
    child: Icon(Icons.add),
  ).obs;

  void updateFloatingActionButton(FloatingActionButton fab) {
    floatingActionButton.value = fab;
  }

  HomeScreenControllerImp(BuildContext context, {required int token}) {
    listPage = [
      HomePage(
        sliderModel: [],
      ),
      SearchScreen(recentCourses: []),
      MyCourses(
        userCoursesModel: [],
        token: '',
      ), // Pass the token parameter directly
      Profile(
        context: context,
      ),
    ];
  }

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
