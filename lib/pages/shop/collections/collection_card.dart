import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/models/collections.dart';
import 'package:mobile/pages/shop/collections/collection_page.dart';

class CollectionCard extends StatefulWidget {
  final Category collection;

  const CollectionCard({Key key, this.collection}) : super(key: key);

  @override
  _CollectionCardState createState() => _CollectionCardState();
}

class _CollectionCardState extends State<CollectionCard> {
  @override
  Widget build(BuildContext context) {
    final collection = widget.collection;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CollectionPage()),
        );
      },
      child: Container(
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
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(collection.pictureUrl),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
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
                        child: GestureDetector(
                          onTap: () {
                            HttpClient()
                                .favorite(context, collection.setId)
                                .then((value) => () {});
                            collection.isLiked = !collection.isLiked;
                            collection.likeCount = collection.likeCount + 1;
                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              collection.isLiked
                                  ? const Icon(
                                      Icons.favorite,
                                      color: CColors.dark_grey,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: CColors.dark_grey,
                                      size: 20,
                                    ),
                              Text(collection.likeCount.toString()),
                            ],
                          ),
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
                        collection.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      Text(
                        collection.text,
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
      ),
    );
  }
}
