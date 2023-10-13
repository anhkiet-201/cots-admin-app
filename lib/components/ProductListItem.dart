import 'package:cots_web_admin/api/model/Product.dart';
import 'package:cots_web_admin/components/ProductSpaceFlex.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem(this.product, {super.key});
  final Product product;

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  bool _isEnter = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
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
          // Navigator.maybeOf(context)?.push(
          //     MaterialPageRoute(builder: (_) => const OrderDetails())
          // );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: const Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey, width: 0.2)),
              color: _isEnter ? Colors.grey.withOpacity(0.2) : null),
          child: ProductSpaceFlex(
            space1: Row(
              children: [
                Image.network(
                  '${product.listProductImage?.first.imageUrl}',
                  width: 30,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10,),
                Expanded(child: _text('${product.name}'))
              ],
            ),
            space2: _text('-'),
            space3: _text('\$${product.price}'),
            space4: _text('\$${product.originalPrice ?? 0}'),
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
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}