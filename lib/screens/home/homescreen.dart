import 'package:Taallam/controller/homescreenController.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    HomeScreenControllerImp myController =
        HomeScreenControllerImp(context, token: 90412);

    return GetBuilder<HomeScreenControllerImp>(
        init: myController, // Initialize the controller
        builder: (controller) {
          return Scaffold(
            backgroundColor: theme.backgroundColor,
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: theme.backgroundColor,
              color: theme.cardColor,
              buttonBackgroundColor: theme.cardColor,
              height: 50,
              items: [
                Icon(Icons.home, size: 30),
                Icon(Icons.manage_search_outlined, size: 30),
                Icon(Icons.school_outlined, size: 30),
                Icon(Icons.person_2_outlined, size: 30),
              ],
              onTap: (index) {
                controller.changePage(index);
                updateFloatingActionButton(controller, context);
              },
            ),
            body: controller.listPage.elementAt(controller.currentpage),
          );
        });
  }

  void updateFloatingActionButton(
      HomeScreenControllerImp controller, BuildContext context) {
    FloatingActionButton newFab;

    switch (controller.currentpage) {
      case 0:
        newFab = FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () {
            // Handle onPressed for the home tab
          },
          child: Icon(
            Icons.home,
            color: Colors.blue,
          ),
        );
        break;
      case 1:
        newFab = FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () {
            // Handle onPressed for the search tab
          },
          child: Icon(Icons.search, color: Colors.blue),
        );
        break;
      // Add more cases for other tabs

      default:
        newFab = FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () {
            // Handle onPressed for other cases
          },
          child: Icon(Icons.add, color: Colors.blue),
        );
    }

    controller.updateFloatingActionButton(newFab);
  }
}



// import 'package:Taallam/screens/profile/search.dart';
// import 'package:flutter/material.dart';
// import 'package:Taallam/Cart/CartListPage.dart';
// import 'package:Taallam/Courses/myCourses.dart';
// import 'package:Taallam/config/Config.dart';
// import 'package:Taallam/screens/home/home_page.dart';

// import '../../Auth/Sign_in.dart';
// import '../../generated/l10n.dart';
// import '../../theme/theme.dart';
// import '../profile/profile.dart';
// import 'Widgets/TopCatWidget.dart';

// import 'FeaturedCourses/widgets/FeaturedCoursesWidget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;

//   late final List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       HomePage(),
//       SearchScreen(recentCourses: []),
//       MyCourses(),
//       Profile(context: context),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final BottomNavigationBarThemeData bottomNavigationBarTheme =
//         Themes.customDarkTheme.bottomNavigationBarTheme;

//     return Scaffold(
//       backgroundColor: theme.backgroundColor,
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         selectedItemColor: bottomNavigationBarTheme.selectedItemColor,
//         unselectedItemColor: bottomNavigationBarTheme.unselectedItemColor,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         backgroundColor: AppColors.DBarColor,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: S.of(context).home,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.manage_search_outlined),
//             label: 'البحث',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school_outlined),
//             label: S.of(context).my_courses,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined),
//             label: S.of(context).profile,
//           ),
//         ],
//       ),
//     );
//   }
// }
