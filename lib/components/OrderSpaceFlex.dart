import 'package:flutter/material.dart';

class OrderSpaceFlex extends StatelessWidget {
  const OrderSpaceFlex({
    super.key,
    required this.space1,
    required this.space2,
    required this.space3,
    required this.space4,
    required this.space5,
    required this.space6,
  });

  final Widget space1;
  final Widget space2;
  final Widget space3;
  final Widget space4;
  final Widget space5;
  final Widget space6;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: space1,
        ),
        Expanded(
          flex: 3,
          child: space2,
        ),
        Expanded(
          flex: 3,
          child: space3,
        ),
        Expanded(
          flex: 2,
          child: space4,
        ),
        Expanded(
          flex: 2,
          child: space5,
        ),
        Expanded(
          flex: 2,
          child: space6,
        ),
      ],
    );
  }
}
