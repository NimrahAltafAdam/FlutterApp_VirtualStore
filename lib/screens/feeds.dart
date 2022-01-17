
import 'package:flutterapp_virtualstore/models/product.dart';
import 'package:flutterapp_virtualstore/provider/products.dart';
import 'package:flutterapp_virtualstore/widgets/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Feeds extends StatelessWidget {

  static const routeName = '/Feeds';
  @override
  Widget build(BuildContext context) {
    //-------------------------66.VIEW ALL PRODUCTS BUTTON FIX-------------------------------
    //final popular = ModalRoute.of(context)?.settings.arguments as String;
    final popular = ModalRoute.of(context)?.settings.arguments;
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
    if(popular == 'popular') {
      productsList = productsProvider.popularProducts;
    }
    return Scaffold(
        // body: FeedProducts(),
      //     StaggeredGridView.countBuilder(
    //     crossAxisCount: 4,
    //     itemCount: 8,
    //     itemBuilder: (BuildContext context, int index) => FeedProducts(
    //     ), // Center // Container
    // staggeredTileBuilder: (int index) =>
    // new StaggeredTile.count(2, index.isEven ? 2 : 1),
    // mainAxisSpacing: 4.0,
    // crossAxisSpacing: 4.0,
    //     )


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