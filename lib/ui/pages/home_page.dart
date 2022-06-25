// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:touristation/models/blogs.dart';
import 'package:touristation/models/photos_model.dart';
import 'package:touristation/services/photos_services.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/services/blog_service.dart';
import 'package:touristation/ui/pages/more_gallery.dart';
import 'package:touristation/ui/widgets/gallery_card.dart';
import 'package:touristation/ui/widgets/popular_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final photosServices photosApi = photosServices();
  late List<PhotosModel> photosList = [];

  final ApiService api = ApiService();
  late List<Blogs> blogList = [];

  @override
  void initState() {
    super.initState();
    loadBlog();
    loadPhotos();
  }

  // const getSeason = () => {
  //       // get current season
  //       const currentDate = new Date();
  //       const currentMonth = currentDate.getMonth();
  //       const currentSeason =
  //           currentMonth >= 3 && currentMonth <= 5
  //               ? 'Spring'
  //               : currentMonth >= 6 && currentMonth <= 8
  //               ? 'Summer'
  //               : currentMonth >= 9 && currentMonth <= 11
  //               ? 'Autumn'
  //               : 'Winter';

  //       return currentSeason;
  //   };
  String getSeason() {
    DateTime currentDate = DateTime.now();
    int currentMonth = currentDate.month;
    String currentSeason = currentMonth >= 3 && currentMonth <= 5
        ? 'Spring'
        : currentMonth >= 6 && currentMonth <= 8
            ? 'Summer'
            : currentMonth >= 9 && currentMonth <= 11
                ? 'Autumn'
                : 'Winter';
    return currentSeason;
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 100,
        width: 255,
        margin: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Touristation',
              style: blackTextStyle.copyWith(
                  fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              'Forget obout work,\ncome vacation.',
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            )
          ],
        ),
      );
    }

    Widget popularSummer() {
      return Container(
          height: 300,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 20,
            left: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Popular in ${getSeason()}',
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var i = 0; i < blogList.length; i++)
                        PopularCard(
                          blog: blogList[i],
                        ),
                    ],
                  ),
                ),
              )
            ],
          ));
    }

    Widget galleryCard() {
      return Container(
        height: 240,
        width: double.infinity,
        margin: EdgeInsets.only(left: 24, bottom: 90, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Gallery',
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorePhotos()));
                    },
                    child: Text(
                      'see more',
                      style: blueTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < photosList.length; i++)
                    GalleryCard(photos: photosList[i]),
                ],
              ),
            ))
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularSummer(),
        galleryCard(),
      ],
    );
  }

  Future loadBlog() {
    Future<List<Blogs>> futureBlog = api.getBlog();
    futureBlog.then((blogList) {
      setState(() {
        this.blogList = blogList;
      });
    });
    return futureBlog;
  }

  Future loadPhotos() {
    Future<List<PhotosModel>> futurePhotos = photosApi.getPhotos();
    futurePhotos.then((photosList) {
      setState(() {
        this.photosList = photosList;
      });
    });
    return futurePhotos;
  }
}
