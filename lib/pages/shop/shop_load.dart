import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/models/categories.dart';
import 'package:mobile/models/singleton.dart';
import 'package:mobile/pages/shop/shop_page.dart';
import 'package:provider/provider.dart';

class ShopLoad extends StatefulWidget {
  const ShopLoad({Key? key}) : super(key: key);

  @override
  _ShopLoadState createState() => _ShopLoadState();
}

class _ShopLoadState extends State<ShopLoad> {
  bool isLoaded = false;

  @override
  void initState() {
    HttpClient().getCatalogs().then((CategoriesModel value) {
      isLoaded = true;
      Provider.of<SingletonProvider>(context,listen: false).categories = value;
      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded ? const ShopPage() : const Center(
          child: CircularProgressIndicator(color: CColors.red,strokeWidth: 6,)),
    );
  }
}
