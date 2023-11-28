class FCModel {
  int id;
  String title;
  String period;
  String start_date;
  String end_date;
  int cost;
  String about;
  int total_cost;
  int visible;
  int my_courses_visible;
  int featured;
  int udemy;
  String link;
  String short_details;
  String image;
  int ordering;
  String course_type;
  String ar_name;
  String details;
  String name;
  String meta_keywords;
  String meta_description;
  String slug;
  int active_offer;
  int offer_price;
  int new_flag;
  int nof_lessons;
  int nof_students;
  int course_type_id;

  FCModel({
    required this.id,
    required this.title,
    required this.period,
    required this.start_date,
    required this.end_date,
    required this.cost,
    required this.about,
    required this.total_cost,
    required this.visible,
    required this.my_courses_visible,
    required this.featured,
    required this.udemy,
    required this.link,
    required this.short_details,
    required this.image,
    required this.ordering,
    required this.course_type,
    required this.ar_name,
    required this.details,
    required this.name,
    required this.meta_keywords,
    required this.meta_description,
    required this.slug,
    required this.active_offer,
    required this.offer_price,
    required this.new_flag,
    required this.nof_lessons,
    required this.nof_students,
    required this.course_type_id,
  });
  factory FCModel.fromJson(Map<String, dynamic> jsonData) {
    try {
      return FCModel(
        id: int.parse(jsonData['id'].toString()),
        title: jsonData['title'] as String,
        period: jsonData['period'] as String,
        start_date: jsonData['start_date'] as String,
        image: jsonData['image'] as String,
        end_date: jsonData['end_date'] as String,
        cost: int.parse(jsonData['cost'].toString()),
        about: jsonData['about'] as String,
        total_cost: int.parse(jsonData['total_cost'].toString()),
        visible: int.parse(jsonData['visible'].toString()),
        my_courses_visible:
            int.parse(jsonData['my_courses_visible'].toString()),
        featured: int.parse(jsonData['featured'].toString()),
        udemy: int.parse(jsonData['udemy'].toString()),
        link: jsonData['link'] as String,
        short_details: jsonData['short_details'] as String,
        ordering: int.parse(jsonData['ordering'].toString()),
        course_type: jsonData['course_type'] as String,
        ar_name: jsonData['ar_name'] as String,
        details: jsonData['details'] as String,
        name: jsonData['name'] as String,
        meta_keywords: jsonData['meta_keywords'] as String,
        meta_description: jsonData['meta_description'] as String,
        slug: jsonData['slug'] as String,
        active_offer: int.parse(jsonData['active_offer'].toString()),
        offer_price: int.parse(jsonData['offer_price'].toString()),
        new_flag: int.parse(jsonData['new_flag'].toString()),
        nof_lessons: int.parse(jsonData['nof_lessons'].toString()),
        nof_students: int.parse(jsonData['nof_students'].toString()),
        course_type_id: int.parse(jsonData['course_type_id'].toString()),
      );
    } catch (e) {
      // Handle the exception, you can log it or provide default values
      print('Error parsing PCModel: $e');
      return FCModel(
        id: 0,
        title: '',
        period: '',
        start_date: '',
        image: '',
        end_date: '',
        cost: 0,
        about: '',
        total_cost: 0,
        visible: 0,
        my_courses_visible: 0,
        featured: 0,
        udemy: 0,
        link: '',
        short_details: '',
        ordering: 0,
        course_type: '',
        ar_name: '',
        details: '',
        name: '',
        meta_keywords: '',
        meta_description: '',
        slug: '',
        active_offer: 0,
        offer_price: 0,
        new_flag: 0,
        nof_lessons: 0,
        nof_students: 0,
        course_type_id: 0,
      );
    }
  }
}
