import '../helper/api.dart';
import '../models/lessonModel.dart';

Future<List<LessonModel>> getAllCoursesPageOfCategry(int courseID) async {
  try {
    List<dynamic> data = await Api().get(url: 'https://osus.academy/home/get_course_lesson_api/$courseID');
    print(data);

    if (data == null || data.isEmpty) {
      throw Exception('No data received from the API');
    }

    List<LessonModel> coursesList = [];
    for (int i = 0; i < data.length; i++) {
      coursesList.add(LessonModel.fromJson(data[i]));
    }
    return coursesList;
  } catch (e) {
    print('Error in getAllCoursesPageOfCategry: $e');
    return [];
  }
}
