import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Image.asset(
                    "assets/logo.png", // Your logo here
                    height: 35.h,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Welcome To Digital Panchikawaththa',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                  Icon(Icons.notifications_none, size: 26.sp),
                ],
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  // Add your search functionality here
                  print("Search bar tapped");
                  // Example: Navigate to a search page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10.w),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Categories',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 60.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryItem("wheel.jpg"),
                    categoryItem("Engine.png"),
                    categoryItem("brake.jpg"),
                    categoryItem("light.jpg"),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Today Hot Deals',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return dealCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(String imageName) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: CircleAvatar(
        radius: 30.r,
        backgroundColor: Colors.grey[200],
        backgroundImage: AssetImage("assets/$imageName"),
      ),
    );
  }

  Widget dealCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: Image.asset(
              "assets/product.png",
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return Icon(Icons.star, color: Colors.amber, size: 14.sp);
                  }),
                ),
                SizedBox(height: 4.h),
                Text(
                  "BMW Tire Valve Stem Caps - Set of 4",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 4.h),
                Text(
                  "LKR 2,000.00",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "42 sold",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                    Icon(Icons.shopping_cart, color: Colors.green, size: 16.sp),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
