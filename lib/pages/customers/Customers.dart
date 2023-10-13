import 'dart:math';

import 'package:cots_web_admin/components/SearchBox.dart';
import 'package:cots_web_admin/pages/BaseLayout.dart';
import 'package:cots_web_admin/pages/customers/CustomersDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: 'Customers',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBox(),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.5))),
              child: FlexSpace(
                space1: _title('Date created'),
                space2: _title('Name'),
                space3: _title('Email'),
                space4: _title('Orders'),
                space5: const SizedBox(),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _ListItem('Kiet', 'igg.anhkiet@gmail.com'),
                  _ListItem('Anh', 'igg.anhkiet@gmail.com'),
                ],
              ),
            )
          ],
        ));
  }

  Widget _title(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.5)),
    );
  }
}

class FlexSpace extends StatelessWidget {
  const FlexSpace(
      {super.key,
      required this.space1,
      required this.space2,
      required this.space3,
      required this.space4,
      required this.space5});

  final Widget space1;
  final Widget space2;
  final Widget space3;
  final Widget space4;
  final Widget space5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: space1),
        Expanded(flex: 2, child: space2),
        Expanded(flex: 3, child: space3),
        Expanded(flex: 1, child: space4),
        SizedBox(
          width: 50,
          child: space5,
        )
      ],
    );
  }
}

class _ListItem extends StatefulWidget {
  _ListItem(this.name, this.email, {super.key}) {
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  final String name;
  final String email;
  late final Color color;

  @override
  State<_ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  bool _isEnter = false;

  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    final email = widget.email;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: const Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey, width: 0.2)),
              color: _isEnter ? Colors.grey.withOpacity(0.2) : null),
          child: FlexSpace(
            space1: const Text(
              '02 Oct 2023',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            space2: _itemName(name),
            space3: Text(
              email,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            space4: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '${Random().nextInt(1)}',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            space5: GestureDetector(
              child: const Icon(Iconsax.edit, size: 18,),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BaseLayout(title: "test", child: Container())
                  )
                );
              },
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const CustomerDetails())
          );
        },
      ),
    );
  }

  Widget _itemName(String name) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name[0],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                  height: 0
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
