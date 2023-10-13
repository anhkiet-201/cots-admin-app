import 'package:flutter/material.dart';

class ProductSpaceFlex extends StatelessWidget {
  const ProductSpaceFlex({
    super.key,
    required this.space1,
    required this.space2,
    required this.space3,
    required this.space4
  });

  final Widget space1;
  final Widget space2;
  final Widget space3;
  final Widget space4;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: space1,
        ),
        Expanded(
          flex: 1,
          child: space2,
        ),
        Expanded(
          flex: 1,
          child: space3,
        ),
        Expanded(
          flex: 1,
          child: space4,
        ),
      ],
    );
  }
}
