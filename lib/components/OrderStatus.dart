import 'dart:ui';

import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  confirmed,
  refused;

  Widget get view {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _statusColor
          ),
        ),
        const SizedBox(width: 5,),
        Text(
          _text,
          style: const TextStyle(
            fontSize: 12
          ),
        )
      ],
    );
  }

  Color get _statusColor {
    switch(this) {
      case OrderStatus.pending: return Colors.grey;
      case OrderStatus.confirmed: return Colors.green;
      case OrderStatus.refused: return Colors.red;
    }
  }

  String get _text {
    switch(this) {
      case OrderStatus.pending: return 'Pending';
      case OrderStatus.confirmed: return 'Confirmed';
      case OrderStatus.refused: return 'Refused';
    }
  }
}