// ignore_for_file: prefer_final_fields, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:touristation/model/summer_blog_model.dart';

class SummerBlogServices {
  
  CollectionReference _summerBlogRef = FirebaseFirestore.instance.collection('summer_blog');
  Future<List<SummerBlogModel>> fetchSummerBlog() async{
    try {
      QuerySnapshot result = await _summerBlogRef.get();
      List<SummerBlogModel> summerBlog = result.docs.map((e){
        return SummerBlogModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return summerBlog;
    } catch (e) {
      throw e;
    }
  }
}