import 'package:flutter/material.dart';
import 'package:mobile/components/compilation_card.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/features/search_bar/search_bar.dart';
import 'package:mobile/models/categories.dart';
import 'package:mobile/models/singleton.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<SingletonProvider>(context).categories;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchBar(),
            Expanded(
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
                  itemCount: categories.categories?.length,
                  itemBuilder: (context, index) =>
                      CompilationCard(index: index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
