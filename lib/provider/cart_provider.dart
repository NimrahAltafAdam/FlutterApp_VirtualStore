
import 'package:flutterapp_virtualstore/models/cart_attr.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  // we can cresate a list similar to products but we will use a map method here
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  //METHOD TO GET TOTAL AMOUNT
  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  //METHOD TO ADD ITEMS TO CART
  void addProductToCart(String productId, String imageUrl, String title,
      double price, int quantity) {
    //First check if the item exists in the cart then update the quantity else add the item to cart
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartAttr(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price,
              imageUrl: imageUrl));

      //By adding the code below the system will be notified about any changes that the user makes in the cart

    }
    notifyListeners();
  }

  //---------------HANDLE + - QUAANTITY----------
  //STEP4
  void reduceItemByOne(
      String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (exitingCartItem) => CartAttr(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              price: exitingCartItem.price,
              quantity: exitingCartItem.quantity - 1,
              imageUrl: exitingCartItem.imageUrl));
    }
    notifyListeners();
  }

  //-> MOVE TO cartFull minus icon

  //-----------REMOVE ITEMS FROM CART OR CLEAR CART-------
  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
//-> MOVE TO cart_full screen and apply this method on icon.times
// then -> go to cart.dart and apply the clearCart() method to the trash icon
//--> After updating the icons MOVE TO cart_full.dart to generate an ALert Box
}
