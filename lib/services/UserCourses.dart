import '../config/Config.dart';
import '../helper/api.dart';
import '../models/CategoryCorModel.dart';
import '../models/userCourses_Model.dart';
import '../screens/home/Categories/widgets/CategoriesWidget.dart';

class UserCoursesService {
  Future<List<UserCoursesModel>> getAllUserCourses(String token) async {
    try {
      List<dynamic> data = await Api().get(
          url:
              'https://taallam-platform.com/home/get_my_courses_api?token=$token');

      // Check if the response is a 404 Not Found
      if (data == null || data is List && data.isEmpty) {
        return []; // Return an empty list when the resource is not found
      }

      // Process the response data as usual
      List<UserCoursesModel> usercoursesList = [];
      for (int i = 0; i < data.length; i++) {
        usercoursesList.add(UserCoursesModel.fromJson(data[i]));
      }

      return usercoursesList;
    } catch (e) {
      print('Error during API call: $e');
      // Handle other errors if needed
      throw e; // Rethrow the exception for the FutureBuilder to catch
    }
  }
}
