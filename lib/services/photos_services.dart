import 'dart:convert';

import 'package:touristation/models/photos_model.dart';
import 'package:http/http.dart';

class photosServices {
  final String apiUrl = "https://turistation-api.arfantestserver.my.id/api/";

  Future<List<PhotosModel>> getPhotos() async{
    Response res = await get(Uri.parse(apiUrl + 'photos/recents'));
    if(res.statusCode == 200){
      var body = jsonDecode(res.body);
      List<PhotosModel> photos = body['data']['photos'].map<PhotosModel>((json){
        return PhotosModel.fromJson(json);
      }).toList();
      return photos;
    } else{
      throw "failed load this Gallery";
    }
  }
}