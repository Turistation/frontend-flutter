// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomReviews extends StatelessWidget {
  const CustomReviews({ Key? key }) : super(key: key);

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
                    image:AssetImage('assets/star.png'),
                  )
                ),
              ),
              Text(
                '4,6',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Text(
            '''
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. In orci auctor augue interdum netus proin convallis mattis velit. Condimentum nisl vitae feugiat volutpat in. Lacus risus malesuada eget tincidunt sagittis ut. Massa lorem id interdum aliquam faucibus mi.
            ''',
            style: black2TextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Review By ',
              style: black2TextStyle,
              children: [
                TextSpan(
                  text: 'Arfan Jadulhaq', style: black2TextStyle.copyWith(
                    fontWeight: FontWeight.w700
                  )
                ),
                TextSpan(
                  text: ', 4/17/2022', style: black2TextStyle
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}