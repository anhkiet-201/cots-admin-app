import 'dart:math';

import 'package:cots_web_admin/components/OrderSpaceFlex.dart';
import 'package:cots_web_admin/components/OrderStatus.dart';
import 'package:cots_web_admin/pages/orders/OrderDetails.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatefulWidget {
  const OrderListItem({super.key});

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _isEnter = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isEnter = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isEnter = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          Navigator.maybeOf(context)?.push(
            MaterialPageRoute(builder: (_) => const OrderDetails())
          );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: const Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey, width: 0.2)),
              color: _isEnter ? Colors.grey.withOpacity(0.2) : null),
          child: OrderSpaceFlex(
            space1: _text(
                '#${Random().nextInt(15)}'
            ),
            space2: _text('10 October 2023 08:10 am'),
            space3: _text('igg.anhkiet1@gmail.com'),
            space4: _text('VnPay'),
            space5: OrderStatus.pending.view,
            space6: _text('\$124.3'),
          ),
        ),
      ),
    );
  }

  Widget _text(String text) => Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Colors.black.withOpacity(0.5)
    ),
  );
}

