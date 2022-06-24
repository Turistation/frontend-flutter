// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';

import '../../models/photos_model.dart';
import '../../services/photos_services.dart';
import '../widgets/gallery_card.dart';

class MorePhotos extends StatefulWidget {
  const MorePhotos({ Key? key }) : super(key: key);

  @override
  State<MorePhotos> createState() => _MorePhotosState();
}

class _MorePhotosState extends State<MorePhotos> {

  final photosServices photosApi = photosServices();
  late List<PhotosModel> photosList = [];
  @override
  void initState() {
    super.initState();
    loadPhotos();
  }

  @override
  Widget build(BuildContext context) {

    Widget morePhotos(){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            for(var i = 0;i < photosList.length; i++)
              GalleryCard(photos: photosList[i]),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Gallery', style: black2TextStyle,),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          morePhotos()
        ],
      ),
    );
  }

  Future loadPhotos(){
    Future<List<PhotosModel>> futurePhotos = photosApi.getPhotos();
    futurePhotos.then((photosList){
      setState(() {
        this.photosList = photosList;
      });
    });
    return futurePhotos;
  }

}