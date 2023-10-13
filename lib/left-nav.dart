import 'package:cots_web_admin/pages/customers/Customers.dart';
import 'package:cots_web_admin/pages/orders/Orders.dart';
import 'package:cots_web_admin/pages/products/Products.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LeftNav extends StatefulWidget {
  const LeftNav({super.key});

  @override
  State<LeftNav> createState() => _LeftNavState();
}

class _LeftNavState extends State<LeftNav> {
  final _controller = PageController();
  int _selectedIndex = 0;
  final _pages = const [
    Orders(),
    Products(),
    Customers()
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: 250,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileBar(),
                _nav(
                  items: const [
                    _NavItem(label: 'Orders', icon: Iconsax.shopping_cart),
                    _NavItem(label: 'Product', icon: Iconsax.tag),
                    _NavItem(label: 'Customers', icon: Iconsax.profile_2user),
                  ],
                  onChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                    _controller.jumpToPage(_selectedIndex);
                  }
                )
              ],
            ),
          ),
          Expanded(
            child: Scaffold(
              backgroundColor: const Color(0xffeeeeee),
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                title: const Text('Pet shop'),
              ),
              body: PageView(
                scrollDirection: Axis.vertical,
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: _pages,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _profileBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llde3gs5xyo808',
            width: 50,
            height: 50,
          ),
        ),
        const SizedBox(height: 10,),
        const Text(
          'Anh Kiet',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          'igg.anhkiet1@gmail.com',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          'Admin panel',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 50,),
      ],
    );
  }

  Widget _nav({required List<_NavItem> items, required Function(int) onChange}) {
    return Column(
      children: [
       for(int i = 0; i < items.length; i++)
         _NavChild(label: items[i].label, icon: items[i].icon, isSelected: i == _selectedIndex, onTap: onChange, index: i,)
      ],
    );
  }

}

class _NavItem {
  const _NavItem({required this.label, required this.icon});
  final IconData icon;
  final String label;
}

class _NavChild extends StatefulWidget {
  const _NavChild({super.key, required this.label, required this.icon, required this.isSelected, required this.onTap, required this.index});
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function(int) onTap;
  final int index;

  @override
  State<_NavChild> createState() => _NavChildState();
}

class _NavChildState extends State<_NavChild> {
  bool _isEnter = false;

  @override
  Widget build(BuildContext context) {
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
        onTap: () {
          widget.onTap(widget.index);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.all(10),
          decoration: widget.isSelected || _isEnter ? BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)
          ) : null,
          child: Row(
            children: [
              Icon(widget.icon),
              const SizedBox(width: 10,),
              Text(
                widget.label,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

