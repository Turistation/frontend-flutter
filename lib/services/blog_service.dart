import 'dart:convert';

import 'package:touristation/models/blogs.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "https://turistation-api.arfantestserver.my.id/api/";

  Future<List<Blogs>> getBlog() async {
    Response res = await get(Uri.parse(apiUrl + 'blogs/recents'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<Blogs> blogs = body['data']['blogs'].map<Blogs>((json) {
        return Blogs.fromJson(json: json);
      }).toList();
      return blogs;
    } else {
      throw "Failed to load blogs list";
    }
  }

  Future<List<Blogs>> getAllBlog(int page,
      {String query = "", String rating = "", String date = ""}) async {
    Response res = await get(Uri.parse(apiUrl +
        'blogs?page=' +
        page.toString() +
        (query != ""
            ? '&query=' + query
            : rating != ""
                ? '&rating=' + rating
                : date != ""
                    ? '&date=' + date
                    : '')));
    print(query != ""
        ? '&query=' + query
        : rating != ""
            ? '&rating=' + rating
            : date != ""
                ? '&date=' + date
                : '');
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<Blogs> blogs = body['data']['blogs']['data'].map<Blogs>((json) {
        return Blogs.fromJson(json: json);
      }).toList();
      return blogs;
    } else {
      throw "Failed to load blogs list";
    }
  }
}
