import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final bool inverted;
  final VoidCallback onTap;

  const SecondaryButton({Key key, @required this.text, @required this.onTap, this.inverted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: CColors.grey.withOpacity(0.5),
            ),
            color: inverted ? CColors.dark_grey : CColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: inverted ? CColors.white : CColors.dark_grey,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
}
