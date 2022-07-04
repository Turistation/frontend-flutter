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
  String dateQuery = "";
  String ratingQuery = "";

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await api.getAllBlog(pageKey, query:query, rating: ratingQuery, date: dateQuery);
      if (ratingQuery != "" || dateQuery != "") {
        ratingQuery = "";
        dateQuery = "";
      }
      ;
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main-page', (route) => false);
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
            )),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Newest Uploaded Blog"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Oldest Uploaded Blog"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Rating Highest"),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text("Rating Lowest"),
                ),
              ],
              initialValue: 2,
              onCanceled: () {
                print("You have canceled the menu.");
              },
              onSelected: (value) {
                switch (value) {
                  case 1:
                    // do something
                    dateQuery = "date-new-to-old";
                    _pagingController.refresh();

                    print("date-new-to-old");
                    break;
                  case 2:
                    // do something else
                    dateQuery = "date-old-to-new";
                    _pagingController.refresh();
                    print("date-old-to-new");
                    break;
                  case 3:
                    ratingQuery = "rating-high-to-low";
                    _pagingController.refresh();
                    print("rating-high-to-low");
                    break;
                  case 4:
                    ratingQuery = "rating-low-to-high";
                    _pagingController.refresh();
                    break;
                }
              },
              icon: Icon(Icons.list),
            )
          ],
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          children: [
            Container(
              child: headerPage(),
              margin: EdgeInsets.only(bottom: 15),
            ),
            Text(
              'Featured Blog',
              style: blackTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
          ],
        )),
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
