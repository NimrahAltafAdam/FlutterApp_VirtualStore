import 'package:flutterapp_virtualstore/consts/colors.dart';
import 'package:flutterapp_virtualstore/models/wishlist_attr.dart';
import 'package:flutterapp_virtualstore/provider/wishlist_provider.dart';
import 'package:flutterapp_virtualstore/services/global_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistFull extends StatefulWidget {

  //-------------------ADD TO WISHLIST----------------------
  //STEP5-create constructor
  final String productId;
  const WishlistFull({required this.productId});
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  //-------------------ADD TO WISHLIST----------------------
  //STEP9
  GlobalMethods globalMethods = GlobalMethods();
  @override
  Widget build(BuildContext context) {
    //-------------------ADD TO WISHLIST----------------------
    //STEP6-Update all the attributes like imageUrl, title & price
    //-->MOVE TO wishlist.dart screen
    final wishlistAttr = Provider.of<WishListAttr>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network(wishlistAttr.imageUrl),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            wishlistAttr.title,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "\$ ${wishlistAttr.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(),
      ],
    );
  }

  Widget positionedRemove() {
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(0.0),
          color: ColorConsts.favColor,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            //-------------------ADD TO WISHLIST----------------------
            //STEP10
            final wishlistProvider =
                Provider.of<WishlistProvider>(context, listen: false);
            globalMethods.showDialogg(
                'Remove item!',
                'Product will be removed from the wishlist!',
                () => wishlistProvider.removeItem(widget.productId),
                context);
          },
        ),
      ),
    );
  }
}
