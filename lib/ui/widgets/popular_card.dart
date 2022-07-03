// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:touristation/models/blogs.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/pages/details_page.dart';

class PopularCard extends StatelessWidget {
  final Blogs blog;
  const PopularCard({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsPage(blog)));
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(right: 24),
        height: 220,
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
                      image: NetworkImage(blog.photo), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              blog.title,
              overflow: TextOverflow.ellipsis,
              style: blackTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              blog.admin.name,
              style: black2TextStyle.copyWith(
                fontSize: 12
              ),
            ),
            SizedBox(height: 3,),
            Text(
              ' ${DateFormat("dd-MM-yyyy").format(new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(blog.createdAt))}',
              style: black2TextStyle.copyWith(
                fontSize: 11
              ),
            )
          ],
        ),
      ),
    );
  }
}
