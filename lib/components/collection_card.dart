import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/models/singleton.dart';
import 'package:provider/provider.dart';

class CollectionCard extends StatefulWidget {
  final int index;

  const CollectionCard({Key? key, required this.index}) : super(key: key);

  @override
  _CollectionCardState createState() => _CollectionCardState();
}

class _CollectionCardState extends State<CollectionCard> {
  @override
  Widget build(BuildContext context) {
    final index = widget.index;
    final collections = Provider.of<SingletonProvider>(context).collections;
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: CColors.grey,
              offset: Offset(0, 1),
              blurRadius: 1,
              blurStyle: BlurStyle.inner),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                        child: Image.network(
                            collections.categories?[index].pictureUrl ?? '',
                            fit: BoxFit.cover),
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
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: CColors.dark_grey,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      collections.categories![index].text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      collections.categories![index].categoryId,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
