class CourseModel {
  final String id;
  final String name;
  final String cost;
  final String startDate;
  final String endDate;
  final String courseType;
  final String shortDetails;
  final String details;
  final String image;
  final String visible;
  final String featured;
  final String metaKeywords;
  final String slug;
  final String metaDescription;
  final String views;

  CourseModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.startDate,
    required this.endDate,
    required this.courseType,
    required this.shortDetails,
    required this.details,
    required this.image,
    required this.visible,
    required this.featured,
    required this.metaKeywords,
    required this.slug,
    required this.metaDescription,
    required this.views,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      cost: json['cost'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      courseType: json['course_type'] ?? '',
      shortDetails: json['short_details'] ?? '',
      details: json['details'] ?? '',
      image: json['image'] ?? '',
      visible: json['visible'] ?? '',
      featured: json['featured'] ?? '',
      metaKeywords: json['meta_keywords'] ?? '',
      slug: json['slug'] ?? '',
      metaDescription: json['meta_description'] ?? '',
      views: json['views'] ?? '',
    );
  }
}
