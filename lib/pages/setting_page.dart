import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Account & Security'),
          SettingsTile(
              title: 'Change Password',
              icon: Icons.lock,
              page: const ChangePasswordPage()),
          SettingsTile(
              title: 'Two-Factor Authentication',
              icon: Icons.shield_outlined,
              page: const TwoFactorPage()),
          SettingsTile(
              title: 'Login Activity',
              icon: Icons.devices,
              page: const LoginActivityPage()),
          SettingsTile(
              title: 'Logout', icon: Icons.logout, page: const LogoutPage()),
          const SectionHeader(title: 'Profile'),
          SettingsTile(
              title: 'Edit Profile',
              icon: Icons.person,
              page: const EditProfile_Page()),
          SettingsTile(
              title: 'Manage Address',
              icon: Icons.location_on,
              page: const ManageAddressPage()),
          SettingsTile(
              title: 'Payment Methods',
              icon: Icons.payment,
              page: const PaymentMethodsPage()),
          const SectionHeader(title: 'App Preferences'),
          SettingsTile(
              title: 'Language',
              icon: Icons.language,
              page: const LanguageSettingsPage()),
          SettingsTile(
              title: 'Theme Mode',
              icon: Icons.brightness_6,
              page: const ThemeModePage()),
          SettingsTile(
              title: 'Notifications',
              icon: Icons.notifications,
              page: const NotificationPage()),
          SettingsTile(
              title: 'Accessibility',
              icon: Icons.accessibility,
              page: const AccessibilityPage()),
          const SectionHeader(title: 'Support & Feedback'),
          SettingsTile(
              title: 'Help Center',
              icon: Icons.help_outline,
              page: const HelpCenter_Page()),
          SettingsTile(
              title: 'Contact Us',
              icon: Icons.mail_outline,
              page: const ContactUsPage()),
          SettingsTile(
              title: 'Report a Problem',
              icon: Icons.bug_report,
              page: const ReportProblemPage()),
          SettingsTile(
              title: 'Leave Feedback',
              icon: Icons.feedback,
              page: const LeaveFeedbackPage()),
          const SectionHeader(title: 'Legal & About'),
          SettingsTile(
              title: 'Privacy Policy',
              icon: Icons.privacy_tip,
              page: const PrivacyPolicyPage()),
          SettingsTile(
              title: 'Terms & Conditions',
              icon: Icons.description,
              page: const TermsConditionsPage()),
          SettingsTile(
              title: 'App Version',
              icon: Icons.info_outline,
              page: const AppVersionPage()),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget page;
  const SettingsTile(
      {required this.title, required this.icon, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF02B91A)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

// Below are empty screen templates for each setting

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _buildScreen(context, 'Change Password');
}

class TwoFactorPage extends StatelessWidget {
  const TwoFactorPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _buildScreen(context, 'Two-Factor Authentication');
}

class LoginActivityPage extends StatelessWidget {
  const LoginActivityPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Login Activity');
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Logout');
}

class EditProfile_Page extends StatelessWidget {
  const EditProfile_Page({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Edit Profile');
}

class ManageAddressPage extends StatelessWidget {
  const ManageAddressPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Manage Address');
}

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _buildScreen(context, 'Payment Methods');
}

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _buildScreen(context, 'Language Settings');
}

class ThemeModePage extends StatelessWidget {
  const ThemeModePage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Theme Mode');
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Notifications');
}

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Accessibility');
}

class HelpCenter_Page extends StatelessWidget {
  const HelpCenter_Page({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Help Center');
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Contact Us');
}

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _buildScreen(context, 'Report a Problem');
}

class LeaveFeedbackPage extends StatelessWidget {
  const LeaveFeedbackPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Leave Feedback');
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'Privacy Policy');
}

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _buildScreen(context, 'Terms & Conditions');
}

class AppVersionPage extends StatelessWidget {
  const AppVersionPage({super.key});
  @override
  Widget build(BuildContext context) => _buildScreen(context, 'App Version');
}

Widget _buildScreen(BuildContext context, String title) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
        child: Text('This is the $title screen',
            style: const TextStyle(fontSize: 16))),
  );
}
