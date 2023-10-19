import 'package:cots_web_admin/components/BaseDialog.dart';
import 'package:cots_web_admin/components/OrderListItem.dart';
import 'package:cots_web_admin/components/OrderListTitle.dart';
import 'package:cots_web_admin/components/OrderSpaceFlex.dart';
import 'package:cots_web_admin/pages/BaseLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: 'Customer Details',
        useBackButton: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info(),
            const SizedBox(height: 25,),
            const Text(
              'Orders 0',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              'An overview of Customer Orders',
              style: TextStyle(
                  fontSize: 12,
              ),
            ),
            const SizedBox(height: 25,),
            const OrderListTitle(),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 1,
            //     itemBuilder: (_, __) => const OrderListItem(),
            //   ),
            // )
          ],
        )
    );
  }

  Widget _info() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(
                'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llde3gs5xyo808',
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(width: 20,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anh Kiet',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                  ),
                ),
                Text(
                  'igg.anhkiet1@gmail.com',
                  style: TextStyle(
                      fontSize: 12
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              children: [
                IconButton(onPressed: _showInfoEdit, icon: const Icon(Iconsax.edit, size: 18,)),
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.trash, size: 18,)),
              ],
            )
          ],
        )
      ],
    );
  }

  _showInfoEdit() {
    showCupertinoDialog(
        context: context,
        useRootNavigator: false,
        builder: (_) => BaseDialog(
            title: 'Edit Customer Details',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'General',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: _textField('First name'),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: _textField('Last name'),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              const Text(
                'Contact',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: _textField('Email', init: 'igg.anhkiet1@gmail.com'),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: _textField('Phone number'),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }

  TextFormField _textField(String hint, {String? init}) {
    return TextFormField(
      initialValue: init,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: hint
              ),
            );
  }
}

