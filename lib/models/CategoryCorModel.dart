class CourseModel {
  final String id;
  final String title;
  final String period;
  final String startDate;
  final String endDate;
  final String cost;
  final String about;
  final String totalCost;
  final String visible;
  final String myCoursesVisible;
  final String featured;
  final String udemy;
  final String link;
  final String shortDetails;
  final String image;
  final String ordering;
  final String courseType;
  final String arName;
  final String details;
  final String name;
  final String metaKeywords;
  final String metaDescription;
  final String slug;
  final String activeOffer;
  final String offerPrice;
  final String newFlag;

  CourseModel({
    required this.id,
    required this.title,
    required this.period,
    required this.startDate,
    required this.endDate,
    required this.cost,
    required this.about,
    required this.totalCost,
    required this.visible,
    required this.myCoursesVisible,
    required this.featured,
    required this.udemy,
    required this.link,
    required this.shortDetails,
    required this.image,
    required this.ordering,
    required this.courseType,
    required this.arName,
    required this.details,
    required this.name,
    required this.metaKeywords,
    required this.metaDescription,
    required this.slug,
    required this.activeOffer,
    required this.offerPrice,
    required this.newFlag,
  });

  factory CourseModel.fromJson(dynamic json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      period: json['period'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      cost: json['cost'],
      about: json['about'],
      totalCost: json['total_cost'],
      visible: json['visible'],
      myCoursesVisible: json['my_courses_visible'],
      featured: json['featured'],
      udemy: json['udemy'],
      link: json['link'],
      shortDetails: json['short_details'],
      image: json['image'],
      ordering: json['ordering'],
      courseType: json['course_type'],
      arName: json['ar_name'],
      details: json['details'],
      name: json['name'],
      metaKeywords: json['meta_keywords'],
      metaDescription: json['meta_description'],
      slug: json['slug'],
      activeOffer: json['active_offer'],
      offerPrice: json['offer_price'],
      newFlag: json['new_flag'],
    );
  }
}

