// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:touristation/models/blogs.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/services/blog_service.dart';
import 'package:touristation/ui/widgets/gallery_card.dart';
import 'package:touristation/ui/widgets/popular_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService api = ApiService();
  late List<Blogs> blogList;

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

    Widget searchBar() {
      return Container(
        height: 56,
        width: 253,
        margin: EdgeInsets.only(top: 15, left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: keyWhiteColor,
          gradient: LinearGradient(colors: [
            keyWhiteColor,
            keyBackgroundColor.withOpacity(1),
          ]),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustmSearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
      );
    }

    Widget popularSummer() {
      return Container(
          height: 250,
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
                  'Popular in Summer',
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
                      PopularCard(),
                      PopularCard(),
                      PopularCard(),
                      PopularCard(),
                      PopularCard(),
                    ],
                  ),
                ),
              )
            ],
          ));
    }

    Widget galleryCard() {
      return Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20, left: 24, bottom: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Gallery',
              style: blackTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GalleryCard(),
                  GalleryCard(),
                  GalleryCard(),
                  GalleryCard(),
                  GalleryCard(),
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
        searchBar(),
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
      debugPrint("test");
    });
    return futureBlog;
  }
}

class CustmSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Big Bang london',
    'Braga, Bandung',
    'Kota Lama, Semarang',
    'Kota Tua, Jakarta',
    'Bojongsoang, Bandung',
    'Menara Eiffel, Paris',
    'Alun-alun Bandung',
    'National zoo, Singapore',
    'Disneyland, Tokyo',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var place in searchTerms) {
      if (place.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(place);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var place in searchTerms) {
      if (place.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(place);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
