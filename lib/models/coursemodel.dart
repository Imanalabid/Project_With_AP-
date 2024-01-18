import 'lessonModel.dart';

class Course {
  final String id;
  final String name;
  final String courseId;
  final String ordering;
  final List<Lesson> lessons;

  Course({
    required this.id,
    required this.name,
    required this.courseId,
    required this.ordering,
    required this.lessons,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    List<dynamic> lessonsData = json['lessons'];

    List<Lesson> lessons = lessonsData.map((lessonJson) {
      return Lesson.fromJson(lessonJson);
    }).toList();

    return Course(
      id: json['id'].toString(),
      name: json['name'].toString(),
      courseId: json['course_id'].toString(),
      ordering: json['ordering'].toString(),
      lessons: lessons,
    );
  }
}