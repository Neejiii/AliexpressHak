import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/circular_indicator.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/models/products.dart';
import 'package:provider/provider.dart';
import 'package:mobile/models/comments.dart';

import '../../../models/singleton.dart';

class ProductPage extends StatefulWidget {
  final int index;

  const ProductPage({Key key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Comment commment;
  Product product;
  int _index = 0;
  bool scrollEnd = true;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final index = widget.index;
    final collections = Provider.of<SingletonProvider>(context).products;
    final products = Provider.of<SingletonProvider>(context).products;
    final comment = Provider.of<SingletonProvider>(context).comments;
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
              child: Stack(
                children: [
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
                            child: Container(decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    collections.categories[index].pictureUrl),
                              ),
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
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
                                child: const Icon(Icons.favorite),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            productDot(0),
                            productDot(1),
                            productDot(2)
                          ],
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
                                    Text(
                                        products.categories[widget.index].price,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 32,
                                            color: Color(0xff333333))),
                                    const SizedBox(width: 5),
                                    const Text("₽",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Color(0xffAAAAAA)))
                                  ]),
                              const SizedBox(height: 5.13),
                              const Text("Доступно: 500 шт.",
                                  style: TextStyle(
                                      color: Color(0xff4DA64A), fontSize: 17)),
                              const SizedBox(height: 28.94),
                              Text(products.categories[widget.index].title,
                                  style: TextStyle(
                                      fontSize: 22, color: Color(0xff333333))),
                              const SizedBox(height: 14.47),
                              Text(products.categories[widget.index].text,
                                  style: TextStyle(
                                      fontSize: 17, color: Color(0xffAAAAAA))),
                              const SizedBox(height: 49.51),
                              const Text("Отзывы: 0",
                                  style: TextStyle(
                                      fontSize: 22, color: Color(0xff333333))),
                              const SizedBox(height: 49.51),

                              const Text("Отзывы пока-что отсутствуют",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xffAAAAAA))),
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
                                          SizedBox(
                                              height: 100,
                                              width: 50,
                                              child: Image(image: AssetImage("assets/images/chainik.png"))),
                                          const SizedBox(width: 12),

                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Чайник заварочный",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Color(0xff333333)),
                                                ),
                                                const SizedBox(height: 3.05),
                                                const Text(
                                                  "Доступно: 157 шт.",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff4DA64A)),
                                                ),
                                                const SizedBox(height: 2.63),
                                                Row(children: const [
                                                  Text("1850",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 22,
                                                          color: Color(
                                                              0xff333333))),
                                                  Text("₽",
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
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 100,
                                              width: 50,
                                              child: Image(image: AssetImage("assets/images/smesytel.png"))),
                                          const SizedBox(width: 12),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Кухонный смеситель",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    color: Color(0xff333333)),
                                              ),
                                              const SizedBox(height: 3.05),
                                              const Text(
                                                "Доступно: 214 шт.",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff4DA64A)),
                                              ),
                                              const SizedBox(height: 2.63),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "3599",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                  Text(
                                                    "₽",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xffAAAAAA)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                            child: SizedBox(
                                                height: 100,
                                                width: 50,
                                                child: Image(image: AssetImage("assets/images/filter.png"))),
                                          ),
                                          const SizedBox(width: 12),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Фильтр для очищения воды",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    color: Color(0xff333333)),
                                              ),
                                              const SizedBox(height: 3.05),
                                              const Text(
                                                "Доступно: 357 шт.",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff4DA64A)),
                                              ),
                                              const SizedBox(height: 2.63),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "2499",
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 22,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                  Text(
                                                    "₽",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                        Color(0xffAAAAAA)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: scrollEnd ? 0 : -500,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 400),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Divider(color: Colors.grey, height: 1),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: CColors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: CColors.dark_grey,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //     builder: (BuildContext context) =>
                                          //         Container(),
                                          //   ),
                                          // );
                                        },
                                        child: const Expanded(
                                          child: Text(
                                            "Купить",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: CColors.white),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: CColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: CColors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                  width: 48,
                                  height: 48,
                                  child: const Icon(
                                    CupertinoIcons.shopping_cart,
                                    color: CColors.grey,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
