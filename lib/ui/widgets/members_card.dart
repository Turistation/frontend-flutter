// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';

class MembersCard extends StatelessWidget {

  final String name;
  final String position;
  final String image;

  const MembersCard({ 
    Key? key,
    required this.name,
    required this.position,
    required this.image, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      width: 301,
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 207,
            width: 154,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(image),)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style : blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  position,
                  style: blueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}