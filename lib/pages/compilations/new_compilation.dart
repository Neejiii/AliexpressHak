import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewCompilation extends StatefulWidget {
  const NewCompilation({Key key}) : super(key: key);

  @override
  _NewCompilationState createState() => _NewCompilationState();
}

class _NewCompilationState extends State<NewCompilation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: [
            SizedBox(
              height: 60,
              width: 414,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
                  child: Text('Создание подборки', style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                  ),),
                )
                ],
              ),
            ),
            SizedBox(
              height: 380,
              width: 500,
              child: Stack(
                // alignment: Alignment.centerLeft,
                children: <Widget>[

                  Positioned(
                    child: SizedBox(
                    height: 300,
                    width: 298,
                    child: Image.asset('assets/images/Background.png'),
                  ),
                    bottom: 80,
                    right: 115,
                  ),
                  Positioned(
                    child: SizedBox(
                      height: 300,
                      width: 298,
                      child: Image.asset('assets/images/Background_two.png'),
                    ),
                    bottom: 80,
                    left: 230,
                  ),


                  Positioned(
                    top: 50,
                    right: 160,
                    child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 100,
                      width: 178,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text('Добавить товар из:',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Montserrat'
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 3, 4, 5),
                                  child: Container(child: IconButton(onPressed: (){},
                                    icon: SvgPicture.asset('assets/icons/dark_heart.svg'),

                                  ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black26,
                                      width: 2,
                                    ),
                                  ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(4, 3, 0, 5),
                                  child: Container(child: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/dark_cart.svg'),),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: 2,
                                      ),
                                    ),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ),
                  Positioned(
                    top: 300,
                    left: 20,
                    child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 175,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.black26,
                              )
                          ),
                          child: TextButton(onPressed: (){}, child: Text('Сделать фото', style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 175,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1.5,
                              color: Colors.black26,
                            )
                          ),
                          child: TextButton(onPressed: (){}, child: Text('Загрузить', style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),),),
                        ),
                      ),

                    ],
                  ),),
                ],

              ),

            ),
            // Positioned(
            //   child:
              SizedBox(
                height: 400,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(27, 8, 0, 5),
                        child: Text("Название*", style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(27, 8, 20, 5),
                        child: TextField(decoration: InputDecoration(
                          hintText: 'Укажите название подборки'
                        ),),
                      ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 8, 0, 5),
                          child: Text("Категории*", style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 8, 20, 5),
                          child: TextField(decoration: InputDecoration(
                              hintText: 'Укажите категории товаров'
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 8, 0, 5),
                          child: Text("Дополнительные товары", style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        //ошибка из за SingleChildScrollView, хз как фиксить пока что

                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 8, 0, 5),
                          child: Container(
                            width: 300,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.black26,
                                )
                            ),
                            child: TextButton(onPressed: (){}, child: Text('Добавить из избранного', style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),),),
                          ),
                        ),
                    ],
                    ),
                  ),
                  ),
                ),
          ],
        ),
      ),
      )
    );
  }
}

