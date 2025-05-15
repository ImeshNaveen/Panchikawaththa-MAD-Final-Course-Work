import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:panchikawaththa/pages/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color primaryColor = Color.fromARGB(255, 20, 211, 3);

  @override
  Widget build(BuildContext context) {
    Color myGreenColor = Color(0xFF02B91A);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [myGreenColor, Colors.green[200]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "SignIn",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Login to your account",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Expanded white section
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 60),
                          // Email Field
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green[200]!,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Password Field (Placeholder)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green[200]!,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [Container(child: PasswordField())],
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Sign In Button
                          ElevatedButton(
                            onPressed: () {
                              print("Sign In button clicked!");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 15,
                              ),
                            ),
                            child: const Text(
                              "Sign In",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "or SignIn with",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 15),
                          // Social Media Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => print("Facebook Sign-In clicked!"),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset("assets/facebook.png"),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () => print("Google Sign-In clicked!"),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset("assets/google.png"),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () => print("iCloud Sign-In clicked!"),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset("assets/apple.png"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Navigation to Sign Up
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Create an account.",
                              style:
                                  TextStyle(fontSize: 16, color: myGreenColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
