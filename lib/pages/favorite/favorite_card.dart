import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/models/singleton.dart';
import 'package:mobile/pages/shop/collections/collection_page.dart';
import 'package:provider/provider.dart';

class FavoriteCard extends StatefulWidget {
  final int index;

  const FavoriteCard({Key key, this.index}) : super(key: key);

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    final index = widget.index;
    final favorites = Provider.of<SingletonProvider>(context).favorites;

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
                                image: NetworkImage(
                                    favorites.favorites[index].pictureUrl),
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
                                .favorite(context,
                                favorites.favorites[index].setId)
                                .then((value) => () {
                              favorites.favorites[index].isLiked =
                              !favorites.favorites[index].isLiked;
                              setState(() {});
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              favorites.favorites[index].isLiked
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
                              Text('12'),
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
                        favorites.favorites[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      Text(
                        favorites.favorites[index].text,
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
