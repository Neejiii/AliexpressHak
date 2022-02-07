import 'package:flutter/material.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/models/categories.dart';
import 'package:mobile/models/singleton.dart';
import 'package:mobile/pages/favorite/favorite_page.dart';
import 'package:provider/provider.dart';

import '../../http_client.dart';

class FavoriteLoad extends StatefulWidget {
  const FavoriteLoad({Key key}) : super(key: key);

  @override
  _FavoriteLoadState createState() => _FavoriteLoadState();
}

class _FavoriteLoadState extends State<FavoriteLoad> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoaded
            ? const FavoritePage()
            : const Center(child: CircularIndicator()));
  }
}
