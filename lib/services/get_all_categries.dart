import 'package:http/http.dart';
import 'package:Taallam/helper/api.dart';

import '../config/Config.dart';
import '../models/Categorymodel.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class CategoryService {
  final String baseUrl =
      '${ApiVariables.BASE_URL}'; // Change this to your desired base URL

  Future<List<CategoryModel>> getAllCategory() async {
    List<dynamic> data =
        await Api().get(url: '${ApiVariables.GET_ALL_CATEGORIES}/');

    List<CategoryModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(CategoryModel.fromJson(data[i]));
    }
    return productsList;
  }
}
