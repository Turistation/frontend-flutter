import 'dart:convert';

import 'package:http/http.dart';
import 'package:touristation/models/category_model.dart';

class CategoryService {
  final String apiUrl = "https://turistation-api.arfantestserver.my.id/api/";

  Future<List<CategoryModel>> getCategory() async {
    Response res = await get(Uri.parse(apiUrl + 'categories'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<CategoryModel> categories =
          body['data']['categories'].map<CategoryModel>((json) {
        return CategoryModel.fromJson(json);
      }).toList();
      return categories;
    } else {
      throw "Failed to load categories list";
    }
  }
}
