// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:touristation/shared/theme.dart';
import 'package:touristation/ui/widgets/feature_card.dart';

import '../../models/blogs.dart';
import '../../services/blog_service.dart';
import '../widgets/popular_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  static const _pageSize = 10;

  final PagingController<int, Blogs> _pagingController =
      PagingController(firstPageKey: 1);

  final ApiService api = ApiService();
  late List<Blogs> blogList = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await api.getAllBlog(pageKey, query: query);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget headerPage() {
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            Flexible(
                child: TextField(
              onChanged: (value) => query = value,
              onSubmitted: (string) => {
                _pagingController.refresh(),
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ))
          ],
        ),
      );
    }

    Widget featureBlog() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 115, left: 24, right: 24, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Blog',
              style: blackTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w700),
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

    // return Scaffold(
    //     backgroundColor: keyBackgroundColor,
    //     body: SingleChildScrollView(
    //       child: Stack(
    //         children: [headerPage(), featureBlog()],
    //         // children: [
    //         //   headerPage(),
    //         // ],
    //       ),
    //     ));
    // return PagedListView<int, Blogs>(
    //   pagingController: _pagingController,
    //   builderDelegate: PagedChildBuilderDelegate<Blogs>(
    //     itemBuilder: (context, item, index) => FeatureCard(
    //       blog: item,
    //     ),
    //   ),
    // );
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            child: headerPage(),
            margin: EdgeInsets.only(bottom: 15),
          ),
        ),
        PagedSliverList<int, Blogs>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Blogs>(
            itemBuilder: (context, item, index) => FeatureCard(
              blog: item,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(height: 50),
        )
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

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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
