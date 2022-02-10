import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/models/singleton.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';

import '../../http_client.dart';
import '../../models/favorites.dart';

class SelectFromFavorites extends StatefulWidget {
  const SelectFromFavorites({Key key}) : super(key: key);

  @override
  _SelectFromFavoritesState createState() => _SelectFromFavoritesState();
}

class _SelectFromFavoritesState extends State<SelectFromFavorites> {
  bool isLoaded = false;
  List selected = [];

  @override
  void initState() {
    HttpClient().getFavorite(context, 'product').then((FavoritesModel value) {
      isLoaded = true;
      Provider.of<SingletonProvider>(context, listen: false).favorites_product =
          value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<SingletonProvider>(context, listen: false)
        .favorites_product;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: CColors.white,
        foregroundColor: CColors.dark_grey,
        backgroundColor: CColors.white,
        actions: const [
          Expanded(
            child: Center(
                child: Text('Ваши избранные', style: TextStyle(fontSize: 24))),
          ),
        ],
      ),
      body: isLoaded
          ? SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: CColors.bg,
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: MultiSelectDialogField(
                      selectedColor: CColors.grey,
                      checkColor: CColors.light_grey,
                      buttonText: const Text('Добавить товары'),
                      cancelText: const Text('Назад'),
                      confirmText: const Text('Принять'),
                      itemsTextStyle: const TextStyle(color: CColors.dark_grey),
                      chipDisplay: MultiSelectChipDisplay(
                        chipColor: CColors.light_grey,
                        textStyle: const TextStyle(color: CColors.dark_grey),
                      ),
                      selectedItemsTextStyle:
                          const TextStyle(color: CColors.dark_grey),
                      buttonIcon: const Icon(Icons.add),
                      items: favorites.favorites
                          .map((e) => MultiSelectItem(e, e.title))
                          .toList(),
                      listType: MultiSelectListType.LIST,
                      onConfirm: (values) {
                        selected.add(values);
                      },
                    ),
                  ),
                  MyButton(
                      text: 'Добавить',
                      onTap: () {
                        Navigator.pop(context, selected);
                      })
                ],
              ),
            )
          : const Center(child: CircularIndicator()),
    );
  }
}
