import 'package:flutter/material.dart';
import 'package:mobile/pages/nav_bar.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/models/products.dart';
import 'package:provider/provider.dart';
import 'package:mobile/models/comments.dart';
import '../../../models/singleton.dart';
import 'package:mobile/main.dart';


class CartPage extends StatefulWidget {
  final int index;


  const CartPage({Key key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Product product;
  int _index = 0;
  List<int>growableList = [];



  @override
  Widget build(BuildContext context) {
    growableList.add(widget.index);
    int itemforbuycountifyouwanttobuycountcountPrivetSemen_TiEtoRead_Pozdravlaiy = 0;
    var Ccolor = Colors.black;
    var Colorr = Colors.grey;
    final index = widget.index;
    final collections = Provider.of<SingletonProvider>(context).products;
    final products = Provider.of<SingletonProvider>(context).products;
    var CheckCircle = Icons.check_circle_outline;
    var CheckCircleSelect = Icons.check_circle;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  GestureDetector(
                  onTap: () {
                    print(growableList);
      // Navigator.push(
      // context,
      // MaterialPageRoute(
      // builder: (context) => NewCompilation(),
      // ),
      // ).then((value) => setState(() {}));
      },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF333333),
                    size: 28,
                  ),
          ),
        ),
      ),
                  Text('Выбрать все',
                    style: TextStyle(
                      fontSize: 16, fontFamily: "Montserrat"
                    ),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        // builder: (context) => NewCompilation(),
                        // ),
                        // ).then((value) => setState(() {}));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.delete_outline,
                            color: Color(0xFF333333),
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
              child: Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width/2.5,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              collections.categories[index].pictureUrl),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                            height: 50,
                            width: 200,
                            child: Text(products.categories[widget.index].title, style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Montserrat'
                            ),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                            height: 25,
                            width: 200,
                            child: Text(products.categories[widget.index].price + " ₽", style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat'
                            ),)),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                    color: Colors.grey
                                )
                              ),
                              child: Icon(Icons.horizontal_rule, color: Colors.black87),

                            ),
                            onTap: (){
                                setState(() {
                                  itemforbuycountifyouwanttobuycountcountPrivetSemen_TiEtoRead_Pozdravlaiy-1;
                                });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(itemforbuycountifyouwanttobuycountcountPrivetSemen_TiEtoRead_Pozdravlaiy.toString(), style: TextStyle(
                            fontSize: 20,
                              color: Colorr
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),

                            child: Container(

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey
                                  )
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    itemforbuycountifyouwanttobuycountcountPrivetSemen_TiEtoRead_Pozdravlaiy+1;
                                  });

                                },
                                child: Icon(Icons.add, color: Colors.black87),
                            ),
                          ),
                        ),
                      ],)

                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
