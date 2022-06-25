// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';

import '../../models/photos_model.dart';
import '../../services/photos_services.dart';
import '../widgets/gallery_card.dart';

class MorePhotos extends StatefulWidget {
  const MorePhotos({Key? key}) : super(key: key);

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
    Widget morePhotos() {
      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: photosList.length,
          itemBuilder: (BuildContext ctx, index) {
            return GalleryCard(photos: photosList[index]);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Featured Gallery',
          style: black2TextStyle,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            itemBuilder: (context){
              return[
                PopupMenuItem(child: Text('Indonesia'), value: 0,),
                PopupMenuItem(child: Text('Jepang'), value: 1,),
                PopupMenuItem(child: Text('Singapore'), value: 2,),
              ];
            },
            onSelected: (value){
              if(value==0){
                print('Indonesia is selected');
              } else if(value==1){
                print('Jepang is selected');
              }else if(value==2){
                print('Sinagpore is selected');
              }
            },
          )
        ],
      ),
      body: morePhotos(),
    );
  }

  Future loadPhotos() {
    Future<List<PhotosModel>> futurePhotos = photosApi.getPhotos();
    futurePhotos.then((photosList) {
      setState(() {
        this.photosList = photosList;
      });
    });
    return futurePhotos;
  }
}
