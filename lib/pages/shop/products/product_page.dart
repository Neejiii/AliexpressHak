import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/models/products.dart';
import 'package:provider/provider.dart';

import '../../../models/singleton.dart';

class ProductPage extends StatefulWidget {
  final int index;

  const ProductPage({Key key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Product product;
  int _index = 0;
  bool scrollEnd = true;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<SingletonProvider>(context).products;
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  setState(() => scrollEnd = false);
                } else if (scrollNotification is ScrollEndNotification) {
                  setState(() => scrollEnd = true);
                }
                return true;
              },
              child: SingleChildScrollView(
                  child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() => _index = index);
                      },
                      children: [
                        Hero(
                            tag: products.categories[widget.index].title,
                            child: Image.network(
                                products.categories[widget.index].pictureUrl,
                                fit: BoxFit.fitWidth)),
                        Image.asset("images/Media.png",
                            alignment: Alignment.topCenter),
                        Image.asset("images/Media.png",
                            alignment: Alignment.topCenter)
                      ],
                    ),
                  ),
                ),
                SafeArea(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 184),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.arrow_back_ios,
                                color: Colors.white)),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset("images/favorite.svg"))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [productDot(0), productDot(1), productDot(2)],
                  ),
                  const SizedBox(height: 15),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                          top: 33.47, left: 16, right: 16, bottom: 139.47),
                      decoration: const BoxDecoration(
                          color: Color(0xffF8F8F8),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(products.categories[widget.index].title,
                                style: const TextStyle(
                                    fontSize: 30, color: Color(0xff333333))),
                            const SizedBox(height: 12.37),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(products.categories[widget.index].price,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32,
                                          color: Color(0xff333333))),
                                  const SizedBox(width: 5),
                                  const Text("₽ / кг",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Color(0xffAAAAAA)))
                                ]),
                            const SizedBox(height: 5.13),
                            const Text("Доступно: 500 кг",
                                style: TextStyle(
                                    color: Color(0xff4DA64A), fontSize: 17)),
                            const SizedBox(height: 28.94),
                            const Text("Тольятти",
                                style: TextStyle(
                                    fontSize: 22, color: Color(0xff333333))),
                            const SizedBox(height: 14.47),
                            const Text(
                                "Савойская капуста, как и белокочанная, образует большие кочаны, но листья у неё тонкие, гофрированные, кочан рыхлый, неплотный. Существуют и листовые сорта савойской капусты. В Россию она была завезена из Западной Европы в XVII веке. В России савойская капуста не получила широкого распространения из-за небольшого срока хранения, сравнительно низкой урожайности (по сравнению с белокочанной) и неиспользуемости в квашении. Савойская капуста по сравнению с белокочанной меньше повреждается заморозками.",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xffAAAAAA))),
                            const SizedBox(height: 49.51),
                            const Text("Похожие товары",
                                style: TextStyle(
                                    fontSize: 22, color: Color(0xff333333))),
                            const SizedBox(height: 15.78),
                            SizedBox(
                                height: 126,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(children: [
                                            Image.asset(
                                              "images/Media (1).png",
                                              width: 145,
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Капуста Савойская",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xff333333)),
                                                  ),
                                                  const SizedBox(height: 3.05),
                                                  const Text(
                                                    "Доступно: 100 кг",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff4DA64A)),
                                                  ),
                                                  const SizedBox(height: 2.63),
                                                  Row(children: const [
                                                    Text("50",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 22,
                                                            color: Color(
                                                                0xff333333))),
                                                    Text("₽ / кг",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Color(
                                                                0xffAAAAAA)))
                                                  ])
                                                ])
                                          ])),
                                      const SizedBox(width: 12),
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(children: [
                                            Image.asset(
                                              "images/Media (2).png",
                                              width: 145,
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Капуста Савойская",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xff333333)),
                                                  ),
                                                  const SizedBox(height: 3.05),
                                                  const Text(
                                                    "Доступно: 100 кг",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff4DA64A)),
                                                  ),
                                                  const SizedBox(height: 2.63),
                                                  Row(children: const [
                                                    Text("50",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 22,
                                                            color: Color(
                                                                0xff333333))),
                                                    Text("₽ / кг",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Color(
                                                                0xffAAAAAA)))
                                                  ])
                                                ])
                                          ]))
                                    ]))
                          ]))
                ]))
              ]))),
          AnimatedPositioned(
              bottom: scrollEnd ? 0 : -500,
              left: 0,
              right: 0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                  color: Colors.white,
                  child: Column(children: [
                    GestureDetector(
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 11, left: 16, right: 13, bottom: 11),
                            child: Row(children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Container()));
                                  },
                                  child: const Text("Перейти к продавцу",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff4DA64A)))),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios)
                            ]))),
                    const Divider(color: Colors.grey, height: 1),
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                scrollEnd = false;
                                // Provider.of<CartProvider>(context, listen: false)
                                //     .cartProducts
                                //     .add(widget.product);
                                // Provider.of<CartProvider>(context, listen: false)
                                //     .cartSlugs
                                //     .add(widget.slug);
                                // Provider.of<CartProvider>(context, listen: false)
                                //     .updateProvider();
                              });
                            },
                            child: Container(
                                height: 46,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          "images/shopping-cart.svg",
                                          height: 22,
                                          width: 25.09),
                                      const SizedBox(width: 9.12),
                                      const Text("Добавить в корзину",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.white))
                                    ]))))
                  ])))
        ],
      ),
    );
  }

  Padding productDot(int index) => Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ClipOval(
          child: Container(
              height: 8,
              width: 8,
              color: _index == index
                  ? Colors.white
                  : const Color.fromRGBO(255, 255, 255, 0.5))));
}
