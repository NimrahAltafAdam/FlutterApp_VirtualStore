import 'package:flutterapp_virtualstore/consts/theme_data.dart';
import 'package:flutterapp_virtualstore/inner_screens/categories_feed.dart';
import 'package:flutterapp_virtualstore/inner_screens/product_details.dart';
import 'package:flutterapp_virtualstore/provider/cart_provider.dart';
import 'package:flutterapp_virtualstore/provider/dark_theme_provider.dart';
import 'package:flutterapp_virtualstore/provider/products.dart';
import 'package:flutterapp_virtualstore/provider/wishlist_provider.dart';
import 'package:flutterapp_virtualstore/screens/bottom_bar.dart';
import 'package:flutterapp_virtualstore/screens/cart.dart';
import 'package:flutterapp_virtualstore/screens/feeds.dart';
import 'package:flutterapp_virtualstore/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inner_screens/brands_navigation_rail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // will declare a variable of class DarkThemeProvider
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(create: (_) =>
            Products(),
          ),
          ChangeNotifierProvider(create: (_) =>
              CartProvider(),
          ),
          ChangeNotifierProvider(create: (_) =>
              WishlistProvider(),
          ),
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            //initialRoute: '/',
            routes: {
              //   '/': (ctx) => LandingPage(),
              BrandNavigationRailScreen.routeName: (ctx) => BrandNavigationRailScreen(),
              Cart.routeName: (ctx) => Cart(),
              Feeds.routeName: (ctx) => Feeds(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
              ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoriesFeedScreen.routeName: (ctx) => CategoriesFeedScreen(),
            },
          );
        }));
  }
}

//In order to switch between light and dark mode provider package was used.
