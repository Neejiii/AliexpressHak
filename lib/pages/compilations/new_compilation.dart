import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/components/secondary_button.dart';
import 'package:mobile/http_client.dart';
import 'package:open_file/open_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../components/theme.dart';
import '../../models/categories.dart';

class NewCompilation extends StatefulWidget {
  const NewCompilation({Key key}) : super(key: key);

  @override
  _NewCompilationState createState() => _NewCompilationState();
}

class _NewCompilationState extends State<NewCompilation> {
  XFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  TextEditingController name;

  bool isLoaded = false;
  var _selected;

  CategoriesModel categories;

  @override
  void initState() {
    HttpClient().getCategories(context).then((value) => {
          setState(() {
            categories = value;
            isLoaded = true;
            _selected = categories.categories.isNotEmpty
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
                child:
                    Text('Создание подборки', style: TextStyle(fontSize: 24))),
          ),
        ],
      ),
      body: SafeArea(
        child: isLoaded
            ? Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      imageLoad(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: SecondaryButton(
                                text: 'Сделать фото',
                                onTap: () => takePhoto(ImageSource.camera)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SecondaryButton(
                                text: 'Загрузить',
                                onTap: () => takePhoto(ImageSource.gallery)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Название*",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: 'Укажите название подборки'),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Категории*",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      MultiSelectDialogField(
                        selectedColor: CColors.grey,
                        checkColor: CColors.light_grey,
                        buttonText: const Text('Выбрать категории'),
                        cancelText: const Text('Назад'),
                        confirmText: const Text('Принять'),
                        itemsTextStyle:
                            const TextStyle(color: CColors.dark_grey),
                        chipDisplay: MultiSelectChipDisplay(
                            chipColor: CColors.light_grey,
                            textStyle:
                                const TextStyle(color: CColors.dark_grey)),
                        selectedItemsTextStyle:
                            const TextStyle(color: CColors.dark_grey),
                        buttonIcon: const Icon(Icons.add),
                        items: categories.categories
                            .map((e) => MultiSelectItem(e, e.title))
                            .toList(),
                        listType: MultiSelectListType.LIST,
                        onConfirm: (values) {
                          _selected = values;
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Дополнительные товары",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SecondaryButton(
                            text: 'Добавить из избранного', onTap: () {}),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SecondaryButton(
                            text: 'Добавить из карзины', onTap: () {}),
                      ),
                      const SizedBox(height: 16),
                      MyButton(
                          text: 'Создать',
                          onTap: () {
                            HttpClient().createCollection(context, _selected, name.text).then((e)=> {});
                          })
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularIndicator(),
              ),
      ),
    );
  }

  Widget imageLoad() {
    return GestureDetector(
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: _imageFile == null
                  ? AssetImage("assets/images/Background.png")
                  : FileImage(File(_imageFile.path)),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    _imageFile = pickedFile;
    setState(() {});
  }
}
