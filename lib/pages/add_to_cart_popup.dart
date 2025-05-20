import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Center(child: ShowCartButton()),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class ShowCartButton extends StatelessWidget {
  const ShowCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show Cart Pop-up'),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (_) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: CartPopupContent(),
          ),
        );
      },
    );
  }
}

class CartPopupContent extends StatefulWidget {
  const CartPopupContent({super.key});

  @override
  State<CartPopupContent> createState() => _CartPopupContentState();
}

class _CartPopupContentState extends State<CartPopupContent> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/wheel.png', fit: BoxFit.contain),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/thumb.png',
                    height: double.infinity,
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Price
          const Text(
            'LKR 105,508.15',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('Price shown before tax',
              style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 12),
          const Divider(),

          // Thumbnails and Quantity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Thumbnails
              Row(
                children: [
                  buildThumbnail('assets/wheel.png'),
                  const SizedBox(width: 8),
                  buildThumbnail('assets/thumb.png'),
                ],
              ),

              // Quantity Selector
              Row(
                children: [
                  const Text('Quantity', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 18),
                          onPressed: decreaseQuantity,
                        ),
                        Text('$quantity'),
                        IconButton(
                          icon: const Icon(Icons.add, size: 18),
                          onPressed: increaseQuantity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Continue Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the popup
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThumbnail(String imagePath) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
