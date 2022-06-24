// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/widgets/feature_card.dart';

import '../../models/blogs.dart';
import '../../services/blog_service.dart';
import '../widgets/popular_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({ Key? key }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  final ApiService api = ApiService();
  late List<Blogs> blogList = [];

  @override
  void initState() {
    super.initState();
    loadBlog();
  }

  @override
  Widget build(BuildContext context) {

    Widget headerPage(){
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.arrow_back)
            ),
            Container(
              height: 45,
              width: 290,
              // margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: keyWhiteColor,
                gradient: LinearGradient(colors:[
                  keyWhiteColor,
                  keyBackgroundColor.withOpacity(1),
                ]),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      showSearch(
                        context: context, 
                        delegate: CustmSearchDelegate());
                    }, 
                    icon: Icon(Icons.search)
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget featureBlog(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 115, left: 24, right: 24, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Blog',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 20),
            for (var i = 0; i < blogList.length; i++)
              FeatureCard(
                blog: blogList[i],
              ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: keyBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            headerPage(),
            featureBlog()
          ],
        ),
      )
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

}

class CustmSearchDelegate extends SearchDelegate{

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
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var place in searchTerms){
      if (place.toLowerCase().contains(query.toLowerCase())){
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
    for (var place in searchTerms){
      if (place.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(place);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}