import 'package:flutterapp_virtualstore/consts/colors.dart';
import 'package:flutterapp_virtualstore/consts/my_icons.dart';
import 'package:flutterapp_virtualstore/provider/wishlist_provider.dart';
import 'package:flutterapp_virtualstore/widgets/wishlist_empty.dart';
import 'package:flutterapp_virtualstore/widgets/wishlist_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';

  @override
  Widget build(BuildContext context) {
    //-------------------ADD TO WISHLIST----------------------
    //STEP3
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItems.isEmpty
    //-> MOVE TO ListViewBuilder
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist (${wishlistProvider.getWishlistItems.length})'),
      ),
      body: ListView.builder(
        //-------------------ADD TO WISHLIST----------------------
        //STEP4
        itemCount: wishlistProvider.getWishlistItems.length,
        //-> MOVE TO wishListFull.dart
        itemBuilder: (BuildContext ctx, int index) {
          //-------------------ADD TO WISHLIST----------------------
          //STEP7
          return ChangeNotifierProvider.value(
            value: wishlistProvider.getWishlistItems.values.toList()[index],
              child: WishlistFull(
              productId: wishlistProvider.getWishlistItems.keys.toList()[index],
          ));
          //->MOVE TO product_details
        },
      ),
    );
  }
}
