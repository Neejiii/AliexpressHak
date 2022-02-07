import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CColors.light_grey,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      height: 60,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 32,
              color: CColors.grey,
            ),
            Text(
              'Поиск',
              style: TextStyle(
                color: Color(0xFF9C9C9C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
