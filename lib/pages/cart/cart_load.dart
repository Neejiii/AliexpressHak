import 'package:flutter/material.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/pages/cart/cart_page.dart';

class CartLoad extends StatefulWidget {
  const CartLoad({Key key}) : super(key: key);

  @override
  _CartLoadState createState() => _CartLoadState();
}

class _CartLoadState extends State<CartLoad> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            const CartPage()
           );
  }
}
