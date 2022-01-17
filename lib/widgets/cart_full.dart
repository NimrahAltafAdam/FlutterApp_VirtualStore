import 'package:flutterapp_virtualstore/consts/colors.dart';
import 'package:flutterapp_virtualstore/inner_screens/product_details.dart';
import 'package:flutterapp_virtualstore/models/cart_attr.dart';
import 'package:flutterapp_virtualstore/provider/cart_provider.dart';
import 'package:flutterapp_virtualstore/provider/dark_theme_provider.dart';
import 'package:flutterapp_virtualstore/services/global_method.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  final String productId;

  const CartFull({required this.productId});
  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();

    final themeChange = Provider.of<DarkThemeProvider>(context);
    //------------------------ADDING ITEMS TO CART(PROVIDER METHOD)-------------
    //STEP3 - update all the parameters like imageUrl etc  using cartAttr
    final cartAttr = Provider.of<CartAttr>(context);

    //------------------------ADDING ITEMS TO CART(PROVIDER METHOD)-------------
    //STEP4- define a method to calculate subtotal
    double subTotal = cartAttr.price * cartAttr.quantity;
    //->use thiis method below to manage the state of subTotal
    //--> After doing that move to cart.dart screen

    //---------------HANDLE + - QUANTITY----------
    //STEP1
    final cartProvider = Provider.of<CartProvider>(context);
    //->move to plus icon

    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
          arguments: widget.productId),
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartAttr.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartAttr.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32.0),
                            // splashColor: ,
                            onTap: () {
                              globalMethods.showDialogg(
                                  'Remove item!',
                                  'Product will be removed from the cart!',
                                  () =>
                                      cartProvider.removeItem(widget.productId),
                                  context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                FontAwesome5.times,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Price:'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${cartAttr.price}\$',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Sub Total:'),
                        SizedBox(
                          width: 5,
                        ),
                        //---------------HANDLE + - QUAANTITY----------
                        //STEP3- FIX OVERFLOW ERROR
                        FittedBox(
                          child: Text(
                            '${subTotal.toStringAsFixed(2)}\$',
                            //-> MOVE TO CART PROVIDER
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: themeChange.darkTheme
                                    ? Colors.brown.shade900
                                    : Theme.of(context).accentColor),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Ships Free',
                          style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade900
                                  : Theme.of(context).accentColor),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            //---------------HANDLE + - QUAANTITY----------
                            //STEP5
                            onTap: cartAttr.quantity < 2
                                ? null
                                : () {
                                    cartProvider
                                        .reduceItemByOne(widget.productId);
                                  },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  FontAwesome5.minus,
                                  color: cartAttr.quantity < 2
                                      ? Colors.grey
                                      : Colors.red,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                ColorConsts.gradiendLStart,
                                ColorConsts.gradiendLEnd,
                              ], stops: [
                                0.0,
                                0.7
                              ]),
                            ),
                            child: Text(
                              cartAttr.quantity.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: () {
                              //---------------HANDLE + - QUAANTITY----------
                              //STEP2
                              cartProvider.addProductToCart(
                                  widget.productId,
                                  cartAttr.imageUrl,
                                  cartAttr.title,
                                  cartAttr.price,
                                  cartAttr.quantity);
                            },
                            //->MOVE TO subTotal to fix the overflow error
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  FontAwesome5.plus,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
