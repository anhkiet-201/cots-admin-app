import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 300,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: Colors.grey)
      ),
      child: Row(
        children: [
          Icon(Icons.search_rounded, size: 20, color: Colors.black.withOpacity(0.5),),
          const SizedBox(width: 10,),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
