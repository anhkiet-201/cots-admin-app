import 'dart:math';

import 'package:cots_web_admin/components/OrderStatus.dart';
import 'package:cots_web_admin/pages/BaseLayout.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double get width => MediaQuery.of(context).size.width - 380;
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      useBackButton: true,
        title: 'Order Details',
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              _overView(),
              _payment(),
              _summary(),
              _address(),
            ],
          ),
        ),
    );
  }

  Widget _address() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: (width / 2) <= 450 ? double.infinity : (width / 2),
      constraints: const BoxConstraints(
        minWidth: 450,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shipping Address',
            style: TextStyle(
                fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 50,),
          const Row(
            children: [
              Text(
                'Province',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
              Spacer(),
              Text(
                'Da Nang',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'District',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
              Spacer(),
              Text(
                'Thanh Khe Tay',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Ward',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
              Spacer(),
              Text(
                'Thanh Khe',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Street',
                style: TextStyle(
                    fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                '110 Nguyen Thi Thap',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                'Anh Kiet',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                'igg.anhkiet1@gmail.com',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Phone number',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                '083 987 4646',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget _overView() {
    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: (width / 2) <= 450 ? double.infinity : (width / 2),
      child: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '#${Random().nextInt(10)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const Spacer(),
                        Text(
                            '10 October 2023 08:${Random().nextInt(10)} am',
                          style: const TextStyle(
                            fontSize: 12
                          ),
                        ),

                      ],
                    ),
                    const Spacer(),
                    OrderStatus.pending.view,
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          height: 25,
                          width: 75,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: const Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 75,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: const Center(
                            child: Text(
                              'Refuse',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          ),
          Expanded(
            child:
            Row(
              children: [
                Expanded(child: _overViewItem('Emai', 'igg.anhkiet1@gmail.com')),
                Expanded(child: _overViewItem('Phone', '083 987 4646')),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _summary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: (width / 2) <= 450 ? double.infinity : (width / 2),
      constraints: const BoxConstraints(
        minWidth: 450,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Summary',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 50,),
          Column(
            children: [
              _product()
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Subtotal',
                style: TextStyle(
                    fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                '\$142.34',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Shipping',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                '\$1.3',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Pay via',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Text(
                'VnPay',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Text(
                '\$141.64',
                style: TextStyle(
                    fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _product() {
    return Row(
      children: [
        Image.network(
          'https://lzd-img-global.slatic.net/g/p/0ce5f361c9acc9ad8441574f8d9e97f1.jpg_720x720q80.jpg',
          width: 36,
          height: 48,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 20,),
        const Expanded(
          child: Text(
            'Cute Lion Mane Cat Wig Hat Funny Pets Clothes Cap Fancy Party Dogs Cosplay Costume Kitten Hat with Ears Accessories Cat Costume',
            style: TextStyle(
              fontSize: 12
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 50,),
        const Text(
          '\$142.34',
          style: TextStyle(
              fontSize: 12
          ),
        ),
        const SizedBox(width: 20,),
        const Text(
          'x1',
          style: TextStyle(
              fontSize: 12
          ),
        ),
        const SizedBox(width: 20,),
        const Text(
          '\$142.34',
          style: TextStyle(
              fontSize: 12
          ),
        ),
      ],
    );
  }

  Widget _payment() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: (width / 2) <= 450 ? double.infinity : (width / 2),
      constraints: const BoxConstraints(
        minWidth: 450,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 50,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'pay_01HCBJ56ETW0V4A4SQM30YBGS8',
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    '10 Oct 2023 08:10',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.7)
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Text(
                '\$142.34',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Total Paid',
                style: TextStyle(
                    fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Text(
                '\$141.64',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Pay via',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Text(
                'VnPay',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _overViewItem(String label, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 5,),
        Text(
          text,
          style: const TextStyle(
              fontSize: 14,
          ),
        ),
      ],
    );
  }
}
