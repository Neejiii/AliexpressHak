import 'package:flutter/material.dart';
import 'package:mobile/http_client.dart';
import 'package:provider/provider.dart';

import '../../components/circular_indicator.dart';
import '../../components/theme.dart';
import '../../models/favorites.dart';
import '../../models/singleton.dart';
import '../shop/collections/collection_card.dart';
import 'favorite_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites =
        Provider.of<SingletonProvider>(context, listen: true).favorites;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder<FavoritesModel>(
            future: HttpClient().getFavorite(context),
            builder:
                (BuildContext context, AsyncSnapshot<FavoritesModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularIndicator(),
                );
              } else if (snapshot.hasData) {
                Provider.of<SingletonProvider>(context, listen: true)
                    .favorites = snapshot.data;
                if (snapshot.data.favorites.isEmpty) {
                  return const Center(
                    child: Text('Пусто'),
                  );
                } else {
                  return Container(
                    color: CColors.bg,
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 262,
                        crossAxisCount: 2,
                      ),
                      itemCount: favorites.favorites.length,
                      itemBuilder: (context, index) =>
                          FavoriteCard(favorite: favorites.favorites[index]),
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
