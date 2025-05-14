import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back),
                    Text("Account",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 10.w),
                        Icon(Icons.notifications_none),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // User Info
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: AssetImage("assets/profile.jpeg"),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("John Snow",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("johnsnow@gmail.com",
                                style: TextStyle(fontSize: 12.sp)),
                            Text("+94 76 942 3847",
                                style: TextStyle(fontSize: 12.sp)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF02B91A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                        child: Text("Edit Profile",
                            style: TextStyle(fontSize: 12.sp)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Services Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _serviceItem(Icons.help_outline, "Help Center"),
                    _serviceItem(Icons.credit_card, "Cards"),
                    _serviceItem(Icons.undo, "Return"),
                    _serviceItem(Icons.card_giftcard, "Coupons"),
                  ],
                ),
                SizedBox(height: 20.h),

                // Recent Purchases
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Purchases",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text("Show all",
                        style: TextStyle(color: Colors.blue, fontSize: 12.sp)),
                  ],
                ),
                SizedBox(height: 12.h),

                _purchaseItem("Item Name", 5, 75000, 375000),
                _purchaseItem("Exide Battery", 1, 45000, 45000),
                _purchaseItem("Turbo Unit", 1, 75000, 75000),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _serviceItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30.sp),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }

  Widget _purchaseItem(String name, int qty, double price, double total) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Image.asset("assets/product.png",
              height: 60.h, width: 60.w, fit: BoxFit.cover),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.sp)),
                Text("Qty: $qty", style: TextStyle(fontSize: 12.sp)),
                Text("LKR ${price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 12.sp)),
                Text("Delivery in 15th OCT",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              Text("LKR ${total.toStringAsFixed(2)}",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              SizedBox(height: 6.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(90.w, 26.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)),
                  padding: EdgeInsets.zero,
                ),
                child: Text("Track Order", style: TextStyle(fontSize: 10.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
