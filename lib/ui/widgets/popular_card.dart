// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/model/summer_blog_model.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/pages/details_page.dart';

class PopularCard extends StatelessWidget {
  final SummerBlogModel summerBlog;
  const PopularCard(this.summerBlog,{ Key? key }) : super(key: key);

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
        height: 210,
        width: 177,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: keyWhiteColor, 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 105,
              width: 143,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(summerBlog.imageUrl),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 10,),
            Text(
              summerBlog.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 5,),
            Text(
              summerBlog.city,
              style: blackTextStyle
            ),
          ],
        ),
      ),
    );
  }
}