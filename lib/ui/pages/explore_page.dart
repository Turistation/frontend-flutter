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
