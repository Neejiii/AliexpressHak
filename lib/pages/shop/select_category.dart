import 'package:flutter/material.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/models/categories.dart';
import 'package:mobile/models/singleton.dart';
import 'package:provider/provider.dart';

import '../../http_client.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key key}) : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  bool isLoaded = false;

  @override
  void initState() {
    HttpClient().getCategories(context).then((CategoriesModel value) {
      isLoaded = true;
      Provider.of<SingletonProvider>(context, listen: false).categories = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<SingletonProvider>(context, listen: false).categories;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: CColors.white,
        foregroundColor: CColors.dark_grey,
        backgroundColor: CColors.white,
        actions: const [
          Expanded(
            child: Center(
                child: Text('Категории', style: TextStyle(fontSize: 24))),
          ),
        ],
      ),
      body: isLoaded
          ? SafeArea(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, '');
                    },
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: Text('Все товары'),
                              ),
                              const SizedBox(
                                child: Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: categories.categories.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context,
                                categories.categories[index].categoryId);
                          },
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          categories.categories[index].title),
                                    ),
                                    const SizedBox(
                                      child:
                                          Icon(Icons.arrow_forward_ios_rounded),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularIndicator()),
    );
  }
}
