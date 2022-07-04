// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/models/photos_model.dart';
import 'package:touristation/shared/theme.dart';

class GalleryCard extends StatelessWidget {
  final PhotosModel photos;
  const GalleryCard({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 156,
          width: 176,
          padding: EdgeInsets.only(left: 10, bottom: 16),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
                image: NetworkImage(photos.photos), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 156,
          width: 176,
          padding: EdgeInsets.only(left: 10, bottom: 16),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.black,
                  ],
                  stops: const [
                    0.0,
                    1.1
                  ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                photos.blog.title,
                style: whiteTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700),
              ),
              Text(
                photos.category.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
