import 'package:flutter/material.dart';
import 'package:panchikawaththa/pages/review.dart';
import 'seller_page.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  final List<String> productImages = [
    'assets/brake.jpg',
    'assets/brake.jpg',
    'assets/brake.jpg',
  ];
  static const Color primaryColor = Color.fromARGB(255, 20, 211, 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: const BackButton(),
        actions: const [
          Icon(Icons.share),
          SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade300)],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: () {},
                child: const Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Scrollable Images
            SizedBox(
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width - 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        productImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Price & Title

            const Text(
              "Power Drilled & Slotted Brake Pads for Chevy",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "LKR 24,900.00",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Free shipping",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SellerPage()),
                      );
                    },
                    child: const Text(
                      "Seller Details",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Inline Rating Summary
            Row(
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                SizedBox(width: 4),
                Text("4.3",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text("(329 ratings)"),
              ],
            ),

            const Divider(height: 30),

            // Ratings & Reviews Section (Moved before product details)
            const RatingsAndReviews(),

            const Divider(height: 30),

            // Product Details
            const Text("Product details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Set of 4 drilled brake pads for front braking. Includes 2 front rotors and 2 ceramic pads with exact OEM specs.\n\n"
              "Great for the road and very safe. Anti-rust coating to extend the life of the brake parts.\n\n"
              "✅ Features:\n• Rust-resistant coating\n• Easy installation\n• Premium durability\n• OEM compatibility\n\n"
              "✅ Compatibility:\nFits most Chevy models with 4-lug rotors. Please check your car model before purchasing.",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class RatingsAndReviews extends StatelessWidget {
  static const Color primaryColor = Color.fromARGB(255, 20, 211, 3);
  const RatingsAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ratings & Reviews',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '4.3',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('23 ratings'),
                const SizedBox(height: 4),
                _buildRatingBar(5, 12),
                _buildRatingBar(4, 5),
                _buildRatingBar(3, 4),
                _buildRatingBar(2, 2),
                _buildRatingBar(1, 0),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildReviewCard(
          "Excellent Seller...quick shipment...item was exactly as stated...quality item! A+++",
          "2***k",
        ),
        _buildReviewCard(
          "Perfect transaction! Item exactly as described, and shipped quickly.",
          "4***n",
        ),
        _buildReviewCard(
          "Item received is exactly as advertised. Fast turnaround on shipping. Smooth transaction.",
          "0***w",
        ),
        const SizedBox(height: 12),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'See More',
              style: TextStyle(color: Colors.white),
            ),
            // Navigate to ReviewPage when pressed
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewsPage()),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  static Widget _buildRatingBar(int star, int count) {
    return Row(
      children: [
        Row(
          children: List.generate(star,
              (_) => const Icon(Icons.star, size: 12, color: Colors.orange)),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 100,
          child: LinearProgressIndicator(
            value: count / 12, // Adjust based on real max
            color: Colors.green,
            backgroundColor: Colors.grey.shade300,
            minHeight: 8,
          ),
        ),
        const SizedBox(width: 8),
        Text('$count'),
      ],
    );
  }

  static Widget _buildReviewCard(String review, String user) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(review),
          const SizedBox(height: 6),
          Row(
            children: [
              Row(
                children: List.generate(
                    5,
                    (_) =>
                        const Icon(Icons.star, size: 14, color: Colors.orange)),
              ),
              const SizedBox(width: 6),
              Text(user, style: const TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
