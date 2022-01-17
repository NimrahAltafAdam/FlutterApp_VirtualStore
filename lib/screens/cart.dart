import 'package:flutterapp_virtualstore/consts/colors.dart';
import 'package:flutterapp_virtualstore/consts/my_icons.dart';
import 'package:flutterapp_virtualstore/provider/cart_provider.dart';
import 'package:flutterapp_virtualstore/services/global_method.dart';
import 'package:flutterapp_virtualstore/widgets/cart_full.dart';
import 'package:flutterapp_virtualstore/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {


  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {

    GlobalMethods globalMethods = GlobalMethods();
    //------------------------ADDING ITEMS TO CART(PROVIDER METHOD)-------------
    //STEP1
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
    //->move to Listview.builder below
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: checkoutSection(context),
            appBar: AppBar(
              title: Text('Cart (${cartProvider.getCartItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear Cart!',
                        'Your cart will be cleared!',
                            () =>
                            cartProvider.clearCart(), context
                        );

                  },
                  icon: Icon(MyAppIcons.trash),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                //------------------------ADDING ITEMS TO CART(PROVIDER METHOD)-------------
                //STEP2- update itemCount
                  itemCount: cartProvider.getCartItems.length,
                  //->move to cartFull.dart
                  itemBuilder: (BuildContext ctx, int index) {



                    //------------------------ADDING ITEMS TO CART(PROVIDER METHOD)-------------
                    //STEP5-Wrap widget with change Notifier **Here as we are using a map instead of list
                    // therefore we will convert the below statement to a list using toList()
                    return ChangeNotifierProvider.value(
                      value: cartProvider.getCartItems.values.toList()[index],
                      child: CartFull(
                        productId: cartProvider.getCartItems.keys.toList()[index],
                        // id: cartProvider.getCartItems.values.toList()[index].id,
                        // productId: cartProvider.getCartItems.keys.toList()[index],
                        // title: cartProvider.getCartItems.values.toList()[index].title,
                        // price: cartProvider.getCartItems.values.toList()[index].price,
                        // imageUrl: cartProvider.getCartItems.values.toList()[index].imageUrl,
                        // quatity: cartProvider.getCartItems.values.toList()[index].quantity,

                      ),
                      //->MOVE TO product_details
                    );
                  }),
            ));
  }

  Widget checkoutSection(BuildContext ctx) {
    final cartProvider = Provider.of<CartProvider>(ctx);
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      ColorConsts.gradiendLStart,
                      ColorConsts.gradiendLEnd,
                    ], stops: [
                      0.0,
                      0.7
                    ]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(ctx).textSelectionColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Total:',
                style: TextStyle(
                    color: Theme.of(ctx).textSelectionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'US \$ ${cartProvider.totalAmount.toStringAsFixed(2)}',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
