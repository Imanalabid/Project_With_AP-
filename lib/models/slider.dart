class SliderModel {
  final String id;
  final String image;
  final String link;

  SliderModel({
    required this.id,
    required this.image,
    required this.link,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'].toString(),
      image: json['image'] ?? '',
      link: json['link'] ?? '',
    );
  }
}
