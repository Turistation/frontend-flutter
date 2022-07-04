// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/pages/details_page.dart';

import '../../models/blogs.dart';

class FeatureCard extends StatelessWidget {
  final Blogs blog;
  const FeatureCard({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsPage(blog)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        height: 134,
        width: 326,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: keyWhiteColor),
        child: Row(
          children: [
            Container(
                height: 110,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(blog.photo), fit: BoxFit.cover),
                )),
            Container(
              height: 110,
              width: 150,
              margin: EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.title,
                      overflow: TextOverflow.ellipsis,
                      style: blackTextStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(blog.comments.isEmpty
                            ? '0'
                            : blog.getAvgStar().toString())
                      ],
                    ),
                    Text(
                      blog.admin.name,
                      style: black2TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' ${DateFormat("dd-MM-yyyy").format(new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(blog.createdAt))}',
                      style: black2TextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
