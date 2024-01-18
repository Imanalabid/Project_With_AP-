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
    var list = json['lessons'] as List;
    List<Lesson> lessonList =
        list.map((lessons) => Lesson.fromJson(lessons)).toList();
    return Course(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      courseId: json['course_id'] ?? '',
      ordering: json['ordering'] ?? '',
      lessons: lessonList,
    );
  }
}

class Lesson {
  final String id;
  final String subjectId;
  final String name;
  final String video;
  final String details;
  final String ordering;
  final String duration;
  final String freePreview;

  Lesson({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.video,
    required this.details,
    required this.ordering,
    required this.duration,
    required this.freePreview,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] ?? '',
      subjectId: json['subject_id'] ?? '',
      name: json['name'] ?? '',
      video: json['video'] ?? '',
      details: json['details'] ?? '',
      ordering: json['ordering'] ?? '',
      duration: json['duration'] ?? '',
      freePreview: json['free_preview'] ?? '',
    );
  }

  get lessons => null;
}
