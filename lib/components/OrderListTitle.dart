import 'package:cots_web_admin/components/OrderSpaceFlex.dart';
import 'package:flutter/material.dart';

class OrderListTitle extends StatelessWidget {
  const OrderListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OrderSpaceFlex(
          space1: _title('Order'),
          space2: _title('Date'),
          space3: _title('Customer'),
          space4: _title('Payment'),
          space5: _title('Status'),
          space6: _title('Total')
      ),
    );
  }

  Widget _title(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.5)
    ),
  );
}
