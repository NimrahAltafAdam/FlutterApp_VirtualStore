
import 'package:flutterapp_virtualstore/models/product.dart';
import 'package:flutterapp_virtualstore/provider/products.dart';
import 'package:flutterapp_virtualstore/widgets/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CategoriesFeedScreen extends StatelessWidget {

  static const routeName = '/CategoriesFeedScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    print(categoryName);
    final productsList = productsProvider.findByCategory(categoryName);
    return Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 420,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(productsList.length, (index) {
            return ChangeNotifierProvider.value(
                value: productsList[index],
                child: FeedProducts());
          },
          ),
        ) // List.generate // Gridview.count
    );
  }
}// Scaffold