//-------------------ADD TO WISHLIST----------------------
//STEP1

import 'package:flutter/material.dart';

class WishListAttr with ChangeNotifier {
  final  String title;
  final String imageUrl;
  final double price;

  WishListAttr({required this.title, required this.price, required this.imageUrl});
}

//->MOVE TO wishlist_provider