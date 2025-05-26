import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ManageProductsPage extends StatefulWidget {
  const ManageProductsPage({super.key});

  @override
  State<ManageProductsPage> createState() => _ManageProductsPageState();
}

class _ManageProductsPageState extends State<ManageProductsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _base64Image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Products')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return const Center(child: Text('Error loading products'));
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());

          final products = snapshot.data!.docs;
          if (products.isEmpty)
            return const Center(child: Text('No products found.'));

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final doc = products[index];
              final data = doc.data() as Map<String, dynamic>;

              return ListTile(
                leading: data['imageBase64'] != null &&
                        data['imageBase64'].isNotEmpty
                    ? Image.memory(base64Decode(data['imageBase64']),
                        width: 40, height: 40, fit: BoxFit.cover)
                    : const Icon(Icons.image),
                title: Text(data['name'] ?? 'No name'),
                subtitle: Text(
                    "LKR ${data['price'] ?? '0.00'} | Stock: ${data['stock'] ?? '0'}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () =>
                          _showProductDialog(context, doc.id, data),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteProduct(doc.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProductDialog(context, null, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _deleteProduct(String id) async {
    try {
      await _firestore.collection('products').doc(id).delete();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Product deleted')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to delete: $e')));
    }
  }

  void _showProductDialog(
      BuildContext context, String? id, Map<String, dynamic>? data) {
    final _formKey = GlobalKey<FormState>();
    String name = data?['name'] ?? '';
    String category = data?['category'] ?? 'Tyer';
    String description = data?['description'] ?? '';
    String price = data?['price']?.toString() ?? '';
    String stock = data?['stock']?.toString() ?? '';
    _base64Image = data?['imageBase64'] ?? '';

    List<String> categories = [
      'Tyer',
      'Brake Pad',
      'Battery',
      'Engine Oil',
      'Air Filter',
      'Spark Plug',
      'Wiper Blade'
    ];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            Future<void> _pickImage() async {
              final picker = ImagePicker();
              final pickedFile = await picker.pickImage(
                  source: ImageSource.gallery, imageQuality: 70);
              if (pickedFile != null) {
                final bytes = await pickedFile.readAsBytes();
                setStateDialog(() {
                  _base64Image = base64Encode(bytes);
                });
              }
            }

            return AlertDialog(
              title: Text(id == null ? 'Add Product' : 'Edit Product'),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: name,
                        decoration:
                            const InputDecoration(labelText: 'Product Name'),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter name'
                            : null,
                        onSaved: (value) => name = value!.trim(),
                      ),
                      TextFormField(
                        initialValue: description,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        onSaved: (value) => description = value?.trim() ?? '',
                      ),
                      TextFormField(
                        initialValue: price,
                        decoration: const InputDecoration(labelText: 'Price'),
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value == null || double.tryParse(value) == null
                                ? 'Enter valid price'
                                : null,
                        onSaved: (value) => price = value!.trim(),
                      ),
                      TextFormField(
                        initialValue: stock,
                        decoration: const InputDecoration(labelText: 'Stock'),
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value == null || int.tryParse(value) == null
                                ? 'Enter valid stock'
                                : null,
                        onSaved: (value) => stock = value!.trim(),
                      ),
                      DropdownButtonFormField<String>(
                        value: category,
                        items: categories
                            .map((cat) => DropdownMenuItem(
                                  value: cat,
                                  child: Text(cat),
                                ))
                            .toList(),
                        decoration:
                            const InputDecoration(labelText: 'Category'),
                        onChanged: (value) =>
                            setStateDialog(() => category = value ?? ''),
                        onSaved: (value) => category = value ?? '',
                      ),
                      const SizedBox(height: 10),
                      _base64Image != null && _base64Image!.isNotEmpty
                          ? Image.memory(base64Decode(_base64Image!),
                              width: 80, height: 80, fit: BoxFit.cover)
                          : const Text('No image selected'),
                      TextButton.icon(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.image),
                        label: const Text('Pick Image'),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      final currentUser = FirebaseAuth.instance.currentUser;
                      final userId = currentUser?.uid ?? '';

                      final product = {
                        'name': name,
                        'description': description,
                        'price': double.parse(price),
                        'stock': int.parse(stock),
                        'category': category,
                        'imageBase64': _base64Image ?? '',
                        'sellerId': userId,
                      };

                      try {
                        if (id == null) {
                          await _firestore.collection('products').add(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Product added')),
                          );
                        } else {
                          await _firestore
                              .collection('products')
                              .doc(id)
                              .update(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Product updated')),
                          );
                        }
                        Navigator.of(context).pop();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to save product: $e')),
                        );
                      }
                    }
                  },
                  child: Text(id == null ? 'Add' : 'Update'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
