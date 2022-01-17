import 'package:flutterapp_virtualstore/inner_screens/categories_feed.dart';
import 'package:flutterapp_virtualstore/screens/feeds.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  List<Map<String,Object>> categories = [
  {
  'categoryName': 'Phones',
  'categoryImagesPath': 'https://cdn.pixabay.com/photo/2022/01/01/18/37/butterfly-6908608__340.jpg',
  },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath': 'https://cdn.pixabay.com/photo/2021/12/19/12/27/road-6881040__480.jpg',
    },
  {
  'categoryName': 'Shoes',
  'categoryImagesPath': 'https://cdn.pixabay.com/photo/2021/11/21/22/08/british-shorthair-6815375__340.jpg'
  },
  {
  'categoryName': 'Beauty & Health',
  'categoryImagesPath': 'https://cdn.pixabay.com/photo/2021/12/29/19/02/peter-6902548__340.jpg'
  },
  {
  'categoryName': 'Laptops',
  'categoryImagesPath': 'https://cdn.pixabay.com/photo/2022/01/01/11/19/ice-6907394__340.jpg',
  },
  {
  'categoryName': 'Furniture',
  'categoryImagesPath': 'https://cdn.pixabay.com/photo/2020/03/26/09/01/snow-4969648__340.jpg',
  },
  {
  'categoryName': 'Watches',
  'categoryImagesPath': 'https://cdn.pixabay.com/photo/2021/12/27/01/30/christmas-6896107__340.jpg',
  }
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoriesFeedScreen.routeName, arguments: '${categories[widget.index]['categoryName' ]}' );
            },
          child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(
              categories[widget.index]['categoryImagesPath']?.toString() ?? ''),
            fit: BoxFit.cover),
          ),
            margin: EdgeInsets.symmetric (horizontal: 10),
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container (
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categories[widget.index]['categoryName']?.toString() ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of (context).textSelectionColor,
              ), // TextStyle
            ), // Text
          ), // Container
        ) // Positioned
      ],
    );
  }
}


