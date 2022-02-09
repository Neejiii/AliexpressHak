import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/models/collections.dart';
import 'package:mobile/models/products.dart';
import 'package:mobile/models/singleton.dart';
import 'package:mobile/pages/shop/products/product_card.dart';
import 'package:mobile/pages/shop/select_category.dart';
import 'package:provider/provider.dart';
import 'package:mobile/components/stories.dart';

import 'collections/collection_card.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  var category = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              searchBar(context),
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
              const SizedBox(
                height: 110,
                child: Stories(),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    FutureBuilder<CollectionsModel>(
                      future: HttpClient().getCollections(context, category),
                      builder: (BuildContext context,
                          AsyncSnapshot<CollectionsModel> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          Provider.of<SingletonProvider>(context, listen: true)
                              .collections = snapshot.data;
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
                              itemCount: snapshot.data.categories.length,
                              itemBuilder: (context, index) =>
                                  CollectionCard(collection: snapshot.data.categories[index]),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularIndicator(),
                          );
                        }
                      },
                    ),
                    FutureBuilder<ProductsModel>(
                      future: HttpClient().getProducts(context, category),
                      builder: (BuildContext context,
                          AsyncSnapshot<ProductsModel> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularIndicator(),
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.done &&
                            snapshot.hasData) {

                          Provider.of<SingletonProvider>(context, listen: true)
                              .products = snapshot.data;
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
                              itemCount: snapshot.data.categories.length,
                              itemBuilder: (context, index) =>
                                  ProductCard(index: index),
                            ),
                          );
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
      ),
    );
  }

  Widget searchCategoryButton(context) => ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SelectCategory(),
              )).then((value) => {
                setState(() {
                  category = value;
                })
              });
        },
        child: Container(
          width: 48,
          height: 48,
          color: CColors.light_grey,
          child: const Icon(
            CupertinoIcons.list_bullet,
            color: CColors.grey,
          ),
        ),
      ));

  Widget searchBar(context) => Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: CColors.light_grey,
                ),
                height: 48,
                child: Row(
                  children: const [
                    SizedBox(width: 20),
                    Icon(
                      CupertinoIcons.search,
                      size: 32,
                      color: CColors.grey,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Поиск',
                      style: TextStyle(
                        color: Color(0xFF9C9C9C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            searchCategoryButton(context)
          ],
        ),
      );
}
