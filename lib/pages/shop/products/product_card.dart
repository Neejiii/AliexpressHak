import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/models/singleton.dart';
import 'package:mobile/pages/shop/products/product_page.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final int index;

  const ProductCard({Key key, this.index}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final index = widget.index;
    final products = Provider.of<SingletonProvider>(context).products;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductPage(index: index)),
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
              color: CColors.light_grey,
              offset: Offset(0, 3),
              blurRadius: 2,
            ),
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
                                    products.categories[index].pictureUrl),
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
                                    products.categories[index].productId, 'product')
                                .then((value) => () {
                                      products.categories[index].isLiked =
                                          !products.categories[index].isLiked;
                                      setState(() {});
                                    });
                            products.categories[index].isLiked = !products.categories[index].isLiked;
                            products.categories[index].likeCount = products.categories[index].likeCount + 1;
                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              products.categories[index].isLiked
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
                              Text(products.categories[index].likeCount
                                  .toString()),
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
                        products.categories[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            FittedBox(
                              child: Text(
                                (double.parse(products.categories[index].price)
                                                .round() *
                                            0.8.round())
                                        .toString() +
                                    '₽',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 18,
                                    color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              (double.parse(products.categories[index].price)
                                          .round())
                                      .toString() +
                                  '₽',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: CColors.dark_grey),
                            ),
                          ],
                        ),
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
