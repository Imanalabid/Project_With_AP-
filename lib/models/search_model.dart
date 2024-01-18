class Search {
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

  Search({
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

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      id: json['id'].toString(),
      name: json['name'].toString(),
      cost: json['cost'].toString(),
      startDate: json['start_date'].toString(),
      endDate: json['end_date'].toString(),
      courseType: json['course_type'].toString(),
      shortDetails: json['short_details'].toString(),
      details: json['details'].toString(),
      image: json['image'].toString(),
      visible: json['visible'].toString(),
      featured: json['featured'].toString(),
      metaKeywords: json['meta_keywords'].toString(),
      slug: json['slug'].toString(),
      metaDescription: json['meta_description'].toString(),
      views: json['views'].toString(),
    );
  }
}
