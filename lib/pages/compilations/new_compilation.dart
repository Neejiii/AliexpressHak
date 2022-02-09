import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/secondary_button.dart';
import 'package:open_file/open_file.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/theme.dart';

class NewCompilation extends StatefulWidget {
  const NewCompilation({Key key}) : super(key: key);

  @override
  _NewCompilationState createState() => _NewCompilationState();
}

class _NewCompilationState extends State<NewCompilation> {
  XFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const TextField(
                  decoration:
                      InputDecoration(hintText: 'Укажите название подборки'),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Категории*",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const TextField(
                  decoration:
                      InputDecoration(hintText: 'Укажите категории товаров'),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Дополнительные товары",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                const SizedBox(height: 20),
              ],
            ),
          ),
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
