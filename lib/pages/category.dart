import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<Map<String, dynamic>> items = [
    {
      'title': '4 Tires Atlas Paraller 4x4 HP 235/60R17 102V XL',
      'price': 93923.83,
      'rating': 5,
      'sold': 725,
      'image': 'assets/wheel.jpg',
    },
    {
      'title': 'Disk Cepek Black DC-2 Aluminum Wheels 119431',
      'price': 82999.86,
      'rating': 4,
      'sold': 542,
      'image': 'assets/wheel.jpg',
    },
    {
      'title': 'Complete Spare Tire Kit 18" + Tools Carrying Case',
      'price': 102748.73,
      'rating': 5,
      'sold': 389,
      'image': 'assets/wheel.jpg',
    },
    {
      'title': 'Scissor Jack Vehicle Wind Up Lift + Wrench',
      'price': 10069.92,
      'rating': 4,
      'sold': 146,
      'image': 'assets/wheel.jpg',
    },
    {
      'title': 'Off-road Monster Tires Set with Yellow Hubs',
      'price': 120000.00,
      'rating': 5,
      'sold': 215,
      'image': 'assets/wheel.jpg',
    },
    {
      'title': 'Blue Chrome Alloy Wheels (Set of 4)',
      'price': 59999.50,
      'rating': 3,
      'sold': 312,
      'image': 'assets/wheel.jpg',
    },
  ];

  Widget _buildStars(int count) {
    return Row(
      children: List.generate(5, (i) {
        return Icon(Icons.star,
            color: i < count ? Colors.amber : Colors.grey[300], size: 12.sp);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 8.w),
                Text(
                  'Wheels, Tires & Parts',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.filter_list),
              ],
            ),
            SizedBox(height: 16.h),
            // Grid View
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260.h,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 12.h,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(item['image'],
                            height: 100.h, fit: BoxFit.contain),
                        SizedBox(height: 6.h),
                        Text(
                          item['title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        SizedBox(height: 4.h),
                        Text("LKR ${item['price'].toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4.h),
                        _buildStars(item['rating']),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${item['sold']} sold",
                                style: TextStyle(fontSize: 11.sp)),
                            Icon(Icons.local_shipping,
                                size: 16.sp, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
