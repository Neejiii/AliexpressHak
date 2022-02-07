import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const CircularProgressIndicator(color: CColors.red, strokeWidth: 6);
}
