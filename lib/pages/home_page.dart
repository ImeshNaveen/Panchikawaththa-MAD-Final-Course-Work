import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panchikawaththa/pages/category.dart';
import 'package:panchikawaththa/pages/chata_bot.dart';
import 'package:panchikawaththa/pages/notification.dart';
import 'package:panchikawaththa/pages/productDetailpage.dart';
import 'package:panchikawaththa/pages/review.dart';
import 'package:panchikawaththa/pages/serviceCenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _showSupportMenu = false;

  void _toggleSupportMenu() {
    setState(() {
      _showSupportMenu = !_showSupportMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 50.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationsPage(),
                            ),
                          );
                        },
                        child: Icon(Icons.notifications_none, size: 26.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search for products",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Icon(Icons.mic, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Categories',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 60.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage()),
                            );
                          },
                          child: categoryItem("wheel.jpg"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage()),
                            );
                          },
                          child: categoryItem("Engine.png"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage()),
                            );
                          },
                          child: categoryItem("brake.jpg"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage()),
                            );
                          },
                          child: categoryItem("light.jpg"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Today Hot Deals',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                      return dealCard(context);
                    },
                  )
                ],
              ),
            ),
          ),
          // Support menu
          if (_showSupportMenu) ...[
            // Add a semi-transparent background for emphasis
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleSupportMenu,
                child: Container(
                  color: Colors.black.withOpacity(0.15),
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              right: 16,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _supportMenuItem(
                      icon: Icons.smart_toy,
                      text: "Chat with Mario",
                      onTap: () {
                        _toggleSupportMenu();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatBotPage()),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    _supportMenuItem(
                      icon: Icons.support_agent,
                      text: "Service Centers",
                      onTap: () {
                        _toggleSupportMenu();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceCentersPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation: 4,
        shape: const CircleBorder(),
        onPressed: _toggleSupportMenu,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: _showSupportMenu
              ? Icon(Icons.close,
                  key: ValueKey('close'), color: Colors.white, size: 32)
              : ClipOval(
                  key: ValueKey('bot'),
                  child: Image.asset(
                    'assets/mario_bot.jpg',
                    width: 46,
                    height: 46,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _supportMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Stronger shadow for emphasis
              blurRadius: 16,
              spreadRadius: 2,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF02B91A), // green color
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Icon(icon, color: Color(0xFF02B91A)), // green color
          ],
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

  Widget dealCard(BuildContext context) {
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
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailPage()),
          );
        },
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
                      Icon(Icons.shopping_cart,
                          color: Colors.green, size: 16.sp),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
