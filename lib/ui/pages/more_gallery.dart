// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:touristation/models/category_model.dart';
import 'package:touristation/services/category_service.dart';
import 'package:touristation/shared/theme.dart';

import '../../models/photos_model.dart';
import '../../services/photos_services.dart';
import '../widgets/gallery_card.dart';

class MorePhotos extends StatefulWidget {
  const MorePhotos({Key? key}) : super(key: key);

  @override
  State<MorePhotos> createState() => _MorePhotosState();
}

class _MorePhotosState extends State<MorePhotos> {
  static const _pageSize = 10;

  final PagingController<int, PhotosModel> _pagingController =
      PagingController(firstPageKey: 1);

  final photosServices photosApi = photosServices();
  final CategoryService categoryApi = CategoryService();
  late List<PhotosModel> photosList = [];
  late List<CategoryModel> categoryModelList = [];
  @override
  void initState() {
    super.initState();
    loadCategory();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  String query = "";

  Future<void> _fetchPage(int pageKey) async {
    print("pageKey: $pageKey");
    var currentPagekey = pageKey == 1 ? pageKey : pageKey - 9;
    print("currentPagekey: $currentPagekey");
    try {
      final newItems =
          await photosApi.getAllPhotos(currentPagekey, query: query);
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

  List<String> listCategoryString = [
    "---Select Category---",
  ];
  String selectedCategory = "---Select Category---";

  @override
  Widget build(BuildContext context) {
    Widget morePhotos() {
      return PagedGridView<int, PhotosModel>(
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: _pagingController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        builderDelegate: PagedChildBuilderDelegate<PhotosModel>(
            itemBuilder: (context, item, index) => GalleryCard(
                  photos: item,
                )),
      );
    }

    Widget dropdownCategory() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          isExpanded: true,
          value: selectedCategory,
          onChanged: (value) {
            setState(() {
              selectedCategory = value.toString();
            });
          },
          items:
              listCategoryString.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(child: Text(value)),
              onTap: () {
                var tempCategory = "";
                for (var i = 0; i < categoryModelList.length; i++) {
                  if (categoryModelList[i].name == value) {
                    tempCategory = categoryModelList[i].id.toString();
                  }
                }
                setState(() {
                  selectedCategory = value;
                  query = value == "---Select Category---" ? "" : tempCategory;
                });
                _pagingController.refresh();
              },
            );
          }).toList(),
        )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Featured Gallery',
          style: black2TextStyle,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body:
          Column(children: [dropdownCategory(), Expanded(child: morePhotos())]),
    );
  }

  Future loadCategory() {
    Future<List<CategoryModel>> categories = categoryApi.getCategory();
    categories.then((categoryList) {
      var tempList = ["---Select Category---"];
      tempList.addAll(categoryList.map((category) {
        return category.name;
      }).toList());
      setState(() {
        listCategoryString = tempList;
        categoryModelList = categoryList;
      });
    });
    return categories;
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

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
