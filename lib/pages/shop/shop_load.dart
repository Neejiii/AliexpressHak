import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/pages/shop/shop_page.dart';

class ShopLoad extends StatefulWidget {
  const ShopLoad({Key? key}) : super(key: key);

  @override
  _ShopLoadState createState() => _ShopLoadState();
}

class _ShopLoadState extends State<ShopLoad> {
  bool isLoaded = false;
  var data;

  @override
  void initState() {
    HttpClient().getData().then((value) => null).then((value) {
      isLoaded = true;
      data = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded ? const ShopPage() : const Center(
          child: CircularProgressIndicator(color: CColors.red,)),
    );
  }
}
