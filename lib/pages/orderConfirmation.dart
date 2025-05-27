import 'package:flutter/material.dart';

void main() => runApp(OrderConfirmationApp());

class OrderConfirmationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderConfirmationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'Order Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProductCard(),
            SizedBox(height: 16),
            _buildAddressSection(),
            SizedBox(height: 16),
            _buildPaymentSection(),
            SizedBox(height: 16),
            _buildSummarySection(),
            SizedBox(height: 16),
            _buildTotalSection(),
            SizedBox(height: 20),
            _buildPayNowButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('MD Store', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'assets/dvd.jpg',
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '7.8" Inch Portable DVD Player Swivel Screen 270° Multi Region In Car USB Charger',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            _buildCounterButton(Icons.remove),
                            SizedBox(width: 5),
                            Text('1'),
                            SizedBox(width: 5),
                            _buildCounterButton(Icons.add),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('Free Shipping', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        Text('Delivery : Oct 28 - 30', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Icon(Icons.edit, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, size: 16),
    );
  }

  Widget _buildAddressSection() {
    return _buildInfoCard(
      title: 'Address',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('John Snow +94 0769423846'),
          Text('No 34, Dematagoda , Maradana'),
          Text('Colombo, Western, Sri Lanka ,10300'),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    return _buildInfoCard(
      title: 'Payment method',
      content: Row(
        children: [
          Image.network(
            'assests/visa.png',
            width: 40,
            height: 24,
          ),
          SizedBox(width: 10),
          Text('4216 67** **** 3456', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return _buildInfoCard(
      title: 'Summary',
      content: Column(
        children: [
          _buildRowText('Subtotal', 'LKR 16,630'),
          Divider(),
          _buildRowText('Promo codes', 'Enter'),
          Divider(),
          _buildRowText('shiping fee', 'free'),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text('LKR 16,630', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red[900])),
      ],
    );
  }

  Widget _buildPayNowButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          child: Text('Pay now', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold,)),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: Color(0xFF01B919),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required Widget content}) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  Widget _buildRowText(String left, String right, {bool isLink = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: TextStyle(color: Colors.black54)),
        Text(
          right,
          style: TextStyle(
            color: isLink ? Colors.blue : Colors.black,
            fontWeight: isLink ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}



