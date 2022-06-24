// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/models/photos_model.dart';
import 'package:touristation/shared/theme.dart';

class GalleryCard extends StatelessWidget {
  final PhotosModel photos;
  const GalleryCard({ Key? key, required this.photos }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      width: 176,
      padding: EdgeInsets.only(left: 10,bottom: 16),
      margin: EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage(photos.photos),
          fit: BoxFit.cover
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '',
            style:whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}