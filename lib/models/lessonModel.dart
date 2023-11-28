class LessonModel {
  String name;

  LessonModel({
    required this.name,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      name: json['name'] ?? '',
    );
  }
}

class CourseModel {
  String id;
  String name;
  String courseId;
  String ordering;
  List<LessonModel> lessons;

  CourseModel({
    required this.id,
    required this.name,
    required this.courseId,
    required this.ordering,
    required this.lessons,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> lessonsData = json['lessons'] ?? [];
    List<LessonModel> lessons = lessonsData.map((lesson) => LessonModel.fromJson(lesson)).toList();

    return CourseModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      courseId: json['course_id'] ?? '',
      ordering: json['ordering'] ?? '',
      lessons: lessons,
    );
  }
}
