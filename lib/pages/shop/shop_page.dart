import 'package:flutter/material.dart';
import 'package:mobile/components/compilation_card.dart';
import 'package:mobile/features/search_bar/search_bar.dart';
import 'package:mobile/models/catalogs.dart';

class ShopPage extends StatefulWidget {
  // final CatalogsModel data;

  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchBar(),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) => CompilationCard(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
