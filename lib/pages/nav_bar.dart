import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/pages/shop/shop_load.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  final myKey = GlobalKey<NavbarState>();
  int currentIndex = 1;
  int seletedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Нижняя навигационная панель
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFF),
        unselectedItemColor: Colors.black54,
        selectedIconTheme: const IconThemeData(color: CColors.red),
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: CColors.red,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              label: 'Шоппинг'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Мой профиль'),
        ],
        currentIndex: seletedItem,
        onTap: (index) {
          setState(
                () {
              seletedItem = index;
            },
          );
        },
      ),
      body: IndexedStack(
        children: const [
          ShopLoad(),
        ],
        index: seletedItem,
      ),
    );
  }
}
