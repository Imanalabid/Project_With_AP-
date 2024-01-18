import '../config/Config.dart';
import '../helper/api.dart';
import '../models/CategoryCorModel.dart';
import '../screens/home/Categories/widgets/CategoriesWidget.dart';

class FeaturedCoursesService {
  Future<List<CourseModel>> getAllCoursesOfCategry(int courseID) async {
    List<dynamic> data =
        await Api().get(url: '${ApiVariables.category_courses}$courseID');
    print(data);
    List<CourseModel> coursesList = [];
    for (int i = 0; i < data.length; i++) {
      coursesList.add(CourseModel.fromJson(data[i]));
    }
    return coursesList;
  }
}
