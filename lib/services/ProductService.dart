import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();

      return snapshot.docs.map((doc) {
        return Product.fromJson(doc.data());
      }).toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
