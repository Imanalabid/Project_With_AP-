import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/Config.dart';
import '../../../../models/CategoryCorModel.dart';
import '../../../../models/Categorymodel.dart';
import '../../../../services/get_CoursesDetails.dart';
import '../../../../services/get_all_categries.dart';
import '../../CategoryCoursespage.dart';
import 'CategoriesCont.dart';

class CategoryCor extends StatefulWidget {
  @override
  State<CategoryCor> createState() => _CategoryCorState();
}

class _CategoryCorState extends State<CategoryCor> {
  late FeaturedCoursesService getCourses = FeaturedCoursesService();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/PCourses');
      },
      child: Container(

        color: AppColors.containerColor,
        child: FutureBuilder<List<CategoryModel>>(
          future: CategoryService().getAllCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CategoryModel> category = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      // Navigate to the SecondScreen when a container is tapped
                      List<CourseModel> categoryCorModel = await getCourses
                          .getAllCoursesOfCategry(category[index].id);
                  //    print('this is the category details: name - ${category[index].en_name} id - ${category[index].id}');
                      _navigateToSecondScreen(context, categoryCorModel);

                    },
                    child: Cont(

                      category: category[index],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void _navigateToSecondScreen(BuildContext context, List<CourseModel> categoryCorModel) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen(categoryCorModel: categoryCorModel),)
    );
  }

}
