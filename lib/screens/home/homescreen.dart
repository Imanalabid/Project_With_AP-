import 'package:flutter/material.dart';
import 'package:Osus/Cart/CartListPage.dart';
import 'package:Osus/Courses/myCourses.dart';
import 'package:Osus/config/Config.dart';
import 'package:Osus/screens/home/home_page.dart';

import '../../Auth/Sign_in.dart';
import '../../generated/l10n.dart';
import '../profile/profile.dart';
import 'Widgets/TopCatWidget.dart';

import 'FeaturedCourses/widgets/FeaturedCoursesWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MyCourses(),
    MyCourses(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: AppColors.Icon1Color,),
            label:   S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined,   color: AppColors.Icon1Color,),
            label:   S.of(context).cart_list,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined,
              color: AppColors.Icon1Color,),
            label:   S.of(context).my_courses,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,
              color: AppColors.Icon1Color,),
            label:   S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
