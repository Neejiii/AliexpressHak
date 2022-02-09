import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/pages/shop/create_collection/create_collection_page.dart';
import 'package:mobile/pages/shop/shop_page.dart';

import 'account/profile.dart';
import 'cart/cart_load.dart';
import 'compilations/new_compilation.dart';
import 'favorite/favorite_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key key}) : super(key: key);

  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  final myKey = GlobalKey<NavbarState>();
  int currentIndex = 1;
  int _seletedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Container(
            color: CColors.white,
            width: double.infinity,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navButton('catalog', 'Каталог', 0),
                navButton('cart', 'Корзина', 1),
                circleAdd(),
                navButton('heart', 'Избранное', 2),
                navButton('account', 'Аккаунт', 3),
              ],
            ),
          )),
      body: IndexedStack(
        children: const [
          ShopPage(),
          CartLoad(),
          FavoritePage(),
          ProfilePage(),
        ],
        index: _seletedItem,
      ),
    );
  }

  Widget circleAdd() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewCompilation(),
          ),
        ).then((value) => setState(() {}));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 40,
          height: 40,
          color: CColors.dark_grey,
          child: const Icon(
            Icons.add_rounded,
            color: CColors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget navButton(String icon, String txt, int index) {
    return SizedBox(
      width: 80,
      height: 40,
      child: InkWell(
        onTap: () {
          _seletedItem = index;
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                'assets/icons/$icon.svg',
                color: _seletedItem == index ? CColors.dark_grey : CColors.grey,
              ),
            ),
            txt.isNotEmpty
                ? FittedBox(
                    child: Text(
                      txt,
                      style: TextStyle(
                          color: _seletedItem == index
                              ? CColors.dark_grey
                              : CColors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
