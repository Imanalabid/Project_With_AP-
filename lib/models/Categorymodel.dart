import 'dart:convert';

class CategoryModel {
  final int id;
  final String ar_name;
  final String en_name;
  final String tr_name;
  final String image;
  final int parent_id;

  CategoryModel({
    required this.id,
    required this.ar_name,
    required this.en_name,
    required this.tr_name,
    required this.image,
    required this.parent_id,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: int.parse(jsonData['id'].toString()),
      ar_name: jsonData['ar_name'] as String,
      en_name: jsonData['en_name'] as String,
      tr_name: jsonData['tr_name'] as String,
      image: jsonData['image'] as String,
      parent_id: int.parse(jsonData['parent_id'].toString()),
    );
  }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "arName": arName,
//         "enName": enName,
//         "image": image,
//         "parentId": parentId,
//       };
// }
}
