// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, unnecessary_new

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:touristation/models/comments_model.dart';

import '../../shared/theme.dart';

class CustomReviews extends StatelessWidget {
  final CommentsModel comments;
  const CustomReviews({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 17,
                width: 17,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/star.png'),
                )),
              ),
              Text(
                (comments.star / 20).toString(),
                style: blackTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            comments.comment,
            style: black2TextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.normal),
          ),
          RichText(
            text:
                TextSpan(text: 'Review By ', style: black2TextStyle, children: [
              TextSpan(
                  text: comments.name,
                  style: black2TextStyle.copyWith(fontWeight: FontWeight.w700)),
              TextSpan(
                  text:
                      ' ${DateFormat("dd-MM-yyyy").format(new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(comments.createdAt))}',
                  style: black2TextStyle),
            ]),
          ),
        ],
      ),
    );
  }
}
