import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/models/categories.dart';
import '../../../components/secondary_button.dart';
import '../../../components/theme.dart';

class CreateCollectionPage extends StatefulWidget {
  const CreateCollectionPage({Key key}) : super(key: key);

  @override
  _CreateCollectionPageState createState() => _CreateCollectionPageState();
}

class _CreateCollectionPageState extends State<CreateCollectionPage> {
  TextEditingController name;
  bool isLoaded = false;
  String select = '';

  CategoriesModel categories;

  @override
  void initState() {
    HttpClient().getCategories(context).then((value) => {
          setState(() {
            categories = value;
            isLoaded = true;
            select = categories.categories.isNotEmpty
                ? categories.categories[0].title
                : '';
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.white,
        appBar: AppBar(
          elevation: 0.4,
          shadowColor: CColors.white,
          foregroundColor: CColors.dark_grey,
          backgroundColor: CColors.white,
          actions: const [
            Expanded(
              child: Center(
                  child: Text('Создание подборки',
                      style: TextStyle(fontSize: 24))),
            ),
          ],
        ),
        body: isLoaded
            ? SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          child: const Placeholder(),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: SecondaryButton(
                                  text: 'Сделать фото', onTap: () {}),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: SecondaryButton(
                                  text: 'Загрузить фото', onTap: () {}),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Название*',
                          style: TextStyle(
                              color: CColors.dark_grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 14, color: CColors.dark_grey),
                          controller: name,
                          decoration: const InputDecoration(
                            labelText: 'Укажите название подборки',
                            fillColor: CColors.light_grey,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CColors.dark_grey),
                            ),
                            labelStyle: TextStyle(color: CColors.dark_grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CColors.dark_grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Категории*',
                          style: TextStyle(
                              color: CColors.dark_grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 14, color: CColors.dark_grey),
                          controller: name,
                          decoration: const InputDecoration(
                            labelText: 'Укажите категории товаров',
                            fillColor: CColors.light_grey,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CColors.dark_grey),
                            ),
                            labelStyle: TextStyle(color: CColors.dark_grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CColors.dark_grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: InputDecorator(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                itemHeight: 50,
                                items:
                                    categories.categories.map((Category value) {
                                  return DropdownMenuItem(
                                    value: value.title,
                                    child: Text(value.title),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    select = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SecondaryButton(
                            text: 'Добавить из избранного', onTap: () {}),
                        const SizedBox(height: 16),
                        SecondaryButton(
                            text: 'Добавить из корзины', onTap: () {}),
                        const SizedBox(height: 30),
                        SecondaryButton(
                            text: 'Создать', onTap: () {}, inverted: true)
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularIndicator(),
              ));
  }
}
