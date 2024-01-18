import '../config/Config.dart';
import '../helper/api.dart';
import '../models/lessonModel.dart';

Future<List<Course>> getAllCoursesPageOfCategory(String courseID) async {
  try {
    List<dynamic>? data =
        await Api().get(url: '${ApiVariables.course_lesson_api}$courseID');
    // print(data);

    if (data == null || data.isEmpty) {
      print('API Response is empty for course ID: $courseID');
      throw Exception('No data received from the API');
    } else {
      List<Course> coursesList = [];
      List<Lesson> lessonList = [];
      for (int i = 0; i < data.length; i++) {
        coursesList.add(Course.fromJson(data[i]));

        if (coursesList == 'lessons') {
          for (var g = 0; g <= i; g++) {
            lessonList.add(Lesson.fromJson(data[g]));
            print('ccccccccccccccccccccccccc${lessonList.first.name}');
          }
        }
      }
      return coursesList;
    }
  } catch (e) {
    print('Error in getAllCoursesPageOfCategry: $e');
    // Handle the error case by returning an empty list or throwing the error
    return [];
  }
}
