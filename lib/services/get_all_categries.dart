import 'package:http/http.dart';
import 'package:Osus/helper/api.dart';

import '../models/Categorymodel.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class CategoryService {
  final String baseUrl = 'https://osus.academy'; // Change this to your desired base URL

  Future<List<CategoryModel>> getAllCategory() async {
    List<dynamic> data = await Api().get(url: '$baseUrl/home/featured_categories_api/');

    List<CategoryModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(CategoryModel.fromJson(data[i]));
    }
    return productsList;
  }
}
