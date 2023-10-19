import 'dart:math';

import 'package:cots_web_admin/api/model/Order.dart';
import 'package:cots_web_admin/components/OrderSpaceFlex.dart';
import 'package:cots_web_admin/components/OrderStatus.dart';
import 'package:cots_web_admin/pages/orders/OrderDetails.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatefulWidget {
  const OrderListItem(this.order, {super.key});
  final Order order;
  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _isEnter = false;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
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
                '#${order.id}'
            ),
            space2: _text('${DateTime.parse(order.orderDate!).toLocal()}'),
            space3: _text('${order.shipEmail}'),
            space4: _text('VnPay'),
            space5: OrderStatus.pending.view,
            space6: _text('\$${order.totalPrice}'),
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

