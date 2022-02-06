import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/pages/shop/shop_load.dart';

import 'account/profile.dart';
import 'cart/cart_load.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

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
          ShopLoad(),
          CartLoad(),
          ShopLoad(),
          ProfilePage(),
        ],
        index: _seletedItem,
      ),
    );
  }

  Widget circleAdd() {
    return ClipRRect(
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
    );
  }

  Widget navButton(String icon, String txt, int index) {
    return SizedBox(
      width: 80,
      height: 40,
      child: InkWell(
        onTap: () {
          setState(() {
            _seletedItem = index;
          });
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
