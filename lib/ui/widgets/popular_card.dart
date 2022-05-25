// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/models/blogs.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/pages/details_page.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({ Key? key, Blogs? blog }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsPage()));
      },
      child: Container(
        padding: EdgeInsets.only(left:15, right: 15),
        margin:EdgeInsets.only(right: 24),
        height: 204,
        width: 177,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: keyWhiteColor, 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 101,
              width: 143,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/bukit.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 15,),
            Text(
              'Buck Kit',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Parlay, Sammer',
              style: blackTextStyle
            ),
          ],
        ),
      ),
    );
  }
}