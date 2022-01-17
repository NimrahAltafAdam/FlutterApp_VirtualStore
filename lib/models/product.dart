//HERE WE HAVE CREATED A MODEL OF PRODUCTS SO THAT DATA CAN BE DISPLAYED DYNAMICALLY
import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final int quantity;
  //final bool isFavorite;
  final bool isPopular;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.productCategoryName,
      required this.brand,
      required this.quantity,
      //required this.isFavorite,
      required this.isPopular});
}
