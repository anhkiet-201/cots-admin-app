import 'package:cots_web_admin/api/model/Order.dart';
import 'package:cots_web_admin/api/services/OrderService.dart';
import 'package:cots_web_admin/components/OrderListItem.dart';
import 'package:cots_web_admin/components/OrderListTitle.dart';
import 'package:cots_web_admin/components/SearchBox.dart';
import 'package:cots_web_admin/pages/BaseLayout.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  Future<List<Order>> _fetch() async {
    return await OrderService.shared.get_all();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: 'Orders',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBox(),
            const SizedBox(height: 20,),
            const _FilterBar(
                filters: [
                  'All',
                  'Pending',
                  'Confirmed',
                  'Refused',
                ]
            ),
            const SizedBox(height: 10,),
            const OrderListTitle(),
            Expanded(
              child: FutureBuilder(
                future: _fetch(),
                builder: (_, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, index) => OrderListItem(data[index]),
                  );
                },
              ),
            )
          ],
        )
    );
  }
}

class _FilterBar extends StatefulWidget {
  const _FilterBar({super.key, required this.filters});
  final List<String> filters;

  @override
  State<_FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<_FilterBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _filter();
  }

  Widget _filter() {
    return Row(
      children: [
        for(int i = 0; i < widget.filters.length; i++)
          _filterItem(i)
      ],
    );
  }

  Widget _filterItem( int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          border: _selectedIndex == index ? Border.all(color: Colors.purple) : null,
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(0.3)
        ),
        child: Center(
          child: Text(
            widget.filters[index],
            style: TextStyle(
                fontSize: 12,
              color: _selectedIndex == index ? Colors.purple : null
            ),
          ),
        ),
      ),
    );
  }
}

