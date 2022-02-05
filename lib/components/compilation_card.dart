import 'package:flutter/material.dart';

class CompilationCard extends StatelessWidget {
  const CompilationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      width: 56,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                          Text('12')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  const [
                    Text(
                      'Заголовок подборки',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    FittedBox(
                      child: Text(
                        'Описание',
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
