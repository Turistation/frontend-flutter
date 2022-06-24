// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';

import '../../models/blogs.dart';

class FeatureCard extends StatelessWidget {
  final Blogs blog;
  const FeatureCard({ Key? key, required this.blog }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 20,),
      height: 134,
      width: 326,
      decoration : BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: keyWhiteColor
      ),
      child: Row(children: [
        Container(
          height: 110,
          width: 140,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(blog.photo),
              fit: BoxFit.cover
            ),
          )
        ),
        Container(
          height: 110,
          width: 150,
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                blog.title,
                overflow: TextOverflow.ellipsis,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 5,),
              // Text(
              //   'Arfan Jadulhaq, 2/9/2022',
              //   style: blackTextStyle.copyWith(
              //     fontSize: 12,
              //     fontWeight: FontWeight.w500
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   height: 20,
              //   width: 100,
              //   child: Row(
              //     children: [
              //       Container(
              //         height: 17,
              //         width: 17,
              //         margin: EdgeInsets.only(right: 5),
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image:AssetImage('assets/star.png'),
              //           )
              //         ),
              //       ),
              //       Text(
              //         '4,6',
              //         style: blackTextStyle.copyWith(
              //           fontSize: 12,
              //           fontWeight: FontWeight.w500
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ]
          ),
        )
      ],),
    );
  }
}