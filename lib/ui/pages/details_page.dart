// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dart_ipify/dart_ipify.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:touristation/models/comments_model.dart';
import 'package:touristation/services/comments_service.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/models/blogs.dart';
import 'package:touristation/ui/widgets/custom_reviews.dart';

class DetailsPage extends StatefulWidget {
  final Blogs blog;
  const DetailsPage(this.blog, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final CommentsService commentsServ = CommentsService();
  late List<CommentsModel> commentsList = [];
  double rating = 0.0;
  String ratingError = "";

  @override
  void initState() {
    super.initState();
    loadComments(widget.blog.id);
  }

  @override
  Widget build(BuildContext context) {
    Widget imageHeader() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.blog.photo), fit: BoxFit.cover)),
      );
    }

    Widget aboutTeks() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.blog.title,
              style: black2TextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Html(data: widget.blog.description),
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

    Widget userReviews() {
      return Container(
        // height: 300,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, left: 24, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reviews',
              style: black2TextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < commentsList.length; i++)
                    CustomReviews(
                      comments: commentsList[i],
                    )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget yourRating() {
      return Container(
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 50),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "You're reviewing:",
                    style: black2TextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    this.rating = rating;
                                    this.ratingError = "";
                                  });
                                }),
                          ],
                        ),
                        Text(
                          ratingError,
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: black2TextStyle,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Review',
                        style: black2TextStyle,
                      ),
                      TextFormField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: 'write your review',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please write your review';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          submitComment(widget.blog.id);
                        },
                        child: Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                              color: keyOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: whiteTextStyle,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ));
    }

    return Scaffold(
        body: ListView(
      children: [imageHeader(), aboutTeks(), userReviews(), yourRating()],
    ));
  }

  Future loadComments(int blogId) {
    Future<List<CommentsModel>> futureComments =
        commentsServ.getComments(blogId);
    futureComments.then((commentsList) {
      setState(() {
        this.commentsList = commentsList;
      });
    });
    return futureComments;
  }

  // Submit Comment
  submitComment(int blogId) async {
    if (_formKey.currentState!.validate() && rating > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("submitting comment...")),
      );
      final ipv4 = await Ipify.ipv4();
      CommentsModel comment = CommentsModel(
          blogId: blogId,
          id: 0,
          comment: commentController.text,
          name: nameController.text,
          star: (rating * 20).toInt(),
          ip: ipv4);
      try {
        await commentsServ.postComments(comment);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => super.widget));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } else {
      if (rating == 0) {
        setState(() {
          this.ratingError = "Please rate the blog";
        });
        return;
      }
    }
  }
}
