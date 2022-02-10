import 'package:flutter/material.dart';
import 'package:mobile/http_client.dart';
import 'package:provider/provider.dart';

import '../../components/circular_indicator.dart';
import '../../components/theme.dart';
import '../../models/favorites.dart';
import '../../models/singleton.dart';
import 'favorite_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  var category = '';

  @override
  Widget build(BuildContext context) {
    final favorites_collection =
        Provider.of<SingletonProvider>(context, listen: true)
            .favorites_collection;
    final favorites_product =
        Provider.of<SingletonProvider>(context, listen: true).favorites_product;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: TabBar(
                unselectedLabelColor: CColors.grey,
                indicatorColor: CColors.dark_grey,
                overlayColor: MaterialStateProperty.all(CColors.light_grey),
                labelColor: CColors.dark_grey,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text('Подборки',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    child: Text('Товары',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  FutureBuilder<FavoritesModel>(
                    future: HttpClient().getFavorite(context, 'set'),
                    builder: (BuildContext context,
                        AsyncSnapshot<FavoritesModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        Provider.of<SingletonProvider>(context, listen: true)
                            .favorites_collection = snapshot.data;
                        if (snapshot.data.favorites.isEmpty) {
                          return const Center(
                            child: Text('Пусто'),
                          );
                        } else {
                          return Container(
                            color: CColors.bg,
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 262,
                                crossAxisCount: 2,
                              ),
                              itemCount: favorites_collection.favorites.length,
                              itemBuilder: (context, index) => FavoriteCard(
                                  favorite:
                                      favorites_collection.favorites[index]),
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
                  FutureBuilder<FavoritesModel>(
                    future: HttpClient().getFavorite(context, 'product'),
                    builder: (BuildContext context,
                        AsyncSnapshot<FavoritesModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        Provider.of<SingletonProvider>(context, listen: true)
                            .favorites_product = snapshot.data;
                        if (snapshot.data.favorites.isEmpty) {
                          return const Center(
                            child: Text('Пусто'),
                          );
                        } else {
                          return Container(
                            color: CColors.bg,
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 262,
                                crossAxisCount: 2,
                              ),
                              itemCount: favorites_product.favorites.length,
                              itemBuilder: (context, index) => FavoriteCard(
                                  favorite: favorites_product.favorites[index]),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
