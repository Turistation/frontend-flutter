// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/models/blogs.dart';
import 'package:touristation/ui/widgets/custom_reviews.dart';

class DetailsPage extends StatelessWidget {
  final Blogs blog;
  const DetailsPage(this.blog,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget imageHeader(){
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(blog.photo), fit: BoxFit.cover)
        ),
      );
    }

    Widget aboutTeks(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              blog.title,
              style: black2TextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 10,),
            Html(data: blog.description),
            // HtmlWidget(blog.description),
            // Text(
            //   blog.description,
            //   // Bidi.stripHtmlIfNeeded(blog.description),
            //   style: black2TextStyle.copyWith(
            //     fontSize: 14,
            //     fontWeight: FontWeight.normal
            //   ),
            // )
          ],
        ),
      );
    }

    Widget userReviews(){
      return Container(
        // height: 300,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, left: 24,  bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reviews',
              style: black2TextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomReviews(),
                  CustomReviews()
                ],
              )
            )
          ],
        ),
      );
    }

    Widget yourRating(){
      return Container(
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You're reviewing:",
              style: black2TextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    "Your rating :",
                  ),
                ),
                RatingBar.builder(
                  minRating: 1,
                  itemSize: 24,
                  updateOnDrag: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ), 
                  onRatingUpdate: (rating){}
                )
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Name',
              style: black2TextStyle,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Write your name here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            ),
            SizedBox(height: 10,),
            Text(
              'Your Review',
              style: black2TextStyle,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Write your Review here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          imageHeader(),
          aboutTeks(),
          userReviews(),
          yourRating()
        ],
      )
    );
  }
}