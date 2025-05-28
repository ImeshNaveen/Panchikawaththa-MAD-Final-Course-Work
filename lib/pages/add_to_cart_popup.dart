import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:panchikawaththa/models/Product_Model.dart';

class CartPopupContent extends StatefulWidget {
  final Product? product;

  const CartPopupContent({super.key, required this.product});

  @override
  State<CartPopupContent> createState() => _CartPopupContentState();
}

class _CartPopupContentState extends State<CartPopupContent> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    if (product == null) {
      return const Center(child: Text("Product not available."));
    }

    double totalPrice = product.price * quantity;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Add to Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: product.imageBase64.isNotEmpty
              ? Image.memory(
                  base64Decode(product.imageBase64.first),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.image),
          title: Text(product.name),
          subtitle: Text('LKR ${product.price.toStringAsFixed(2)}'),
        ),
        const SizedBox(height: 8),

        /// Quantity Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: decrementQuantity,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Text(
              '$quantity',
              style: const TextStyle(fontSize: 18),
            ),
            IconButton(
              onPressed: incrementQuantity,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),

        const SizedBox(height: 8),
        Text(
          'Total: LKR ${totalPrice.toStringAsFixed(2)}',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close popup
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Added $quantity item(s) to cart")),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: const Text("Confirm Add to Cart",
              style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
