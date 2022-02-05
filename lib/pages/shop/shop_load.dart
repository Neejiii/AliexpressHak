import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/models/catalogs.dart';
import 'package:mobile/pages/shop/shop_page.dart';

class ShopLoad extends StatefulWidget {
  const ShopLoad({Key? key}) : super(key: key);

  @override
  _ShopLoadState createState() => _ShopLoadState();
}

class _ShopLoadState extends State<ShopLoad> {
  bool isLoaded = true;
  var data;

  @override
  void initState() {
    HttpClient().getCatalogs().then((CatalogsModel value) {
      isLoaded = true;
      data = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded ? ShopPage() : const Center(
          child: CircularProgressIndicator(color: CColors.red,strokeWidth: 6,)),
    );
  }
}
