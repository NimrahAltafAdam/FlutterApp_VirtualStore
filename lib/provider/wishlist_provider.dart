
//-------------------ADD TO WISHLIST----------------------
//STEP2
import 'package:flutterapp_virtualstore/models/wishlist_attr.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  Map<String, WishListAttr> _wishlistItems = {};

  Map<String, WishListAttr> get getWishlistItems {
    return {..._wishlistItems};
  }

  //METHOD TO ADD ITEM TO WISHLIST
  void addToWishlist(String productId,String title, String imageUrl, double price) {
    if(_wishlistItems.containsKey(productId)) {

    } else {
      _wishlistItems.putIfAbsent(productId, () => WishListAttr(title: title, price: price, imageUrl: imageUrl));
    }
    notifyListeners();
  }

  //METHOD TO REMOVE ITEMS FROM WISHLIST
  void removeItem(String productId) {
    _wishlistItems.remove(productId);
    notifyListeners();
  }
}
//->MOVE TO wishlist.dart