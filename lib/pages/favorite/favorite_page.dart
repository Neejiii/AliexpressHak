import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/theme.dart';
import '../../models/singleton.dart';
import '../shop/collections/collection_card.dart';
import 'favorite_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<SingletonProvider>(context, listen: true).favorites;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: CColors.bg,
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 262,
              crossAxisCount: 2,
            ),
            itemCount: favorites.favorites.length,
            itemBuilder: (context, index) => FavoriteCard(index: index),
          ),
        ),
      ),
    );
  }
}
