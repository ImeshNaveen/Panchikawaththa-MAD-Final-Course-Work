import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});
  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: false,
        actions: const [
          Icon(Icons.settings),
          SizedBox(width: 16),
          Icon(Icons.notifications_none),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'DigitalPanchikawatta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.black,
                            ),
                            foregroundColor: WidgetStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {},
                          child: Text('Sign in/ Register'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/mario.png',
                    height: 130,
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Divider(
              height: 2,
              thickness: 1,
              indent: 8,
              endIndent: 8,
              color: Colors.black12,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _AccountOption(icon: Icons.headset_mic, label: 'Help Center'),
                _AccountOption(icon: Icons.credit_card, label: 'Cards'),
                _AccountOption(icon: Icons.keyboard_return, label: 'Return'),
                _AccountOption(icon: Icons.discount, label: 'Coupons'),
              ],
            ),
            const SizedBox(height: 14),
            Divider(
              height: 2,
              thickness: 1,
              indent: 8,
              endIndent: 8,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _AccountOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.black87),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
