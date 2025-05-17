import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<bool> selectedItems = [false, false, false, false, false];
  double total = 0;

  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Front Brake Disc',
      'price': 15003.25,
      'image': 'assets/brake.jpg',
      'quantity': 1
    },
    {
      'name': 'Clutch Disc',
      'price': 12919.47,
      'image': 'assets/clutch_disc.jpg',
      'quantity': 1
    },
    {
      'name': 'Alternator',
      'price': 45000.00,
      'image': 'assets/alternator.jpg',
      'quantity': 1
    },
    {
      'name': 'Lid Projector Headlights',
      'price': 105500.00,
      'image': 'assets/light.jpg',
      'quantity': 1
    },
    {
      'name': 'Air Filter',
      'price': 5670.00,
      'image': 'assets/airfilter.jpg',
      'quantity': 1
    },
  ];

  void updateTotal() {
    total = 0;
    for (int i = 0; i < selectedItems.length; i++) {
      if (selectedItems[i]) {
        total += cartItems[i]['price'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                SizedBox(width: 10.w),
                Text('My Cart',
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.delete_outline),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Checkbox(
                  value: selectedItems.every((item) => item),
                  onChanged: (value) {
                    setState(() {
                      selectedItems =
                          List.filled(selectedItems.length, value ?? false);
                      updateTotal();
                    });
                  },
                ),
                Text("Select all", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      children: [
                        Checkbox(
                          value: selectedItems[index],
                          onChanged: (value) {
                            setState(() {
                              selectedItems[index] = value!;
                              updateTotal();
                            });
                          },
                        ),
                        Image.asset(item['image'], width: 50.w, height: 50.h),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp)),
                              SizedBox(height: 4.h),
                              Text('LKR ${item['price'].toStringAsFixed(2)}',
                                  style: TextStyle(color: Color(0xFF02B91A))),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.remove_circle_outline),
                            SizedBox(width: 6.w),
                            Text('1'),
                            SizedBox(width: 6.w),
                            Icon(Icons.add_circle_outline),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: ElevatedButton(
          onPressed: () {
            // Payment logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF02B91A),
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r)),
          ),
          child: Text(
            'Pay Now\nLKR ${total.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
