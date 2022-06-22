import 'dart:convert';

import 'package:http/http.dart';
import 'package:touristation/models/comments_model.dart';

class CommentsService {
  final String apiUrl = "https://turistation-api.arfantestserver.my.id/api";

  Future<List<CommentsModel>> getComments(int blog) async {
    Response res =
        await get(Uri.parse(apiUrl + '/comments/' + blog.toString()));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<CommentsModel> comments =
          body['data']['comments'].map<CommentsModel>((json) {
        return CommentsModel.fromJson(json);
      }).toList();
      comments = comments.reversed.toList();
      return comments;
    } else {
      throw "Failed to load user comments";
    }
  }

  Future<int> postComments(CommentsModel comment) async {
    final url = Uri.parse(apiUrl + '/comments');
    final response = await post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(comment.toJson()));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.statusCode;
    } else {
      print(response.statusCode);
      var body = jsonDecode(response.body);
      print(body);
      throw "Failed to post  comments";
    }
  }
}
