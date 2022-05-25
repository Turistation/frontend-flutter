import 'dart:convert';

import 'package:touristation/models/blogs.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "http://10.0.0.2/api/";

  Future<List<Blogs>> getBlog() async {
    Response res = await get(Uri.parse(apiUrl + 'blogs'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Blogs> blogs =
          body.map((dynamic item) => Blogs.fromJson(item)).toList();
      return blogs;
    } else {
      throw "Failed to load blogs list";
    }
  }
}
