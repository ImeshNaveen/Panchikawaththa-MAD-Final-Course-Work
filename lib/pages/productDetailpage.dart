import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panchikawaththa/models/product_model.dart';
import 'package:panchikawaththa/pages/review.dart';
import 'seller_page.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  const ProductDetailPage(
      {super.key, required this.productId, required Product Product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map<String, dynamic>? productData;
  bool isLoading = true;

  static const Color primaryColor = Color.fromARGB(255, 20, 211, 3);

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    final doc = await FirebaseFirestore.instance
        .collection('products')
        .doc(widget.productId)
        .get();

    if (doc.exists) {
      setState(() {
        productData = doc.data();
        isLoading = false;
      });
    }
  }

  void _addToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item added to cart!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || productData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final images = List<String>.from(productData!['images']);
    final title = productData!['title'];
    final price = productData!['price'];
    final description = productData!['description'];
    final rating = productData!['rating'].toDouble();
    final totalRatings = productData!['totalRatings'];

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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () => _addToCart(context),
                child: const Text("Add to Cart",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  // Buy now logic
                },
                child: const Text("Buy Now",
                    style: TextStyle(color: Colors.white)),
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
            SizedBox(
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width - 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(images[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(title,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text("LKR ${price.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Free shipping",
                style: TextStyle(
                    color: primaryColor, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SellerPage()));
              },
              child: const Text("Seller Details",
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                    children: List.generate(
                        4,
                        (_) => const Icon(Icons.star,
                            color: Colors.orange, size: 20))),
                const SizedBox(width: 4),
                Text(rating.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Text("($totalRatings ratings)"),
              ],
            ),
            const Divider(height: 30),
            ReviewsPage(), // You can link Firestore reviews here too
            const Divider(height: 30),
            const Text("Product details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description,
                style: const TextStyle(fontSize: 14, height: 1.5)),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
