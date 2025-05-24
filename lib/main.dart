import 'package:flutter/material.dart';
import 'package:panchikawaththa/pages/SpashScreen.dart';
import 'package:panchikawaththa/pages/main_layout.dart';
import 'package:panchikawaththa/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Panchikawaththa App',
          theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          home: const AuthWrapper(),
        );
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // While checking auth status
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        // If user is logged in
        if (snapshot.hasData) {
          return const MainLayout();
        }

        // If user is logged out
        return const LoginPage();
      },
    );
  }
}
