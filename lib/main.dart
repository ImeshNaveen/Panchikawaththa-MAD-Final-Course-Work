import 'package:flutter/material.dart';
import 'package:panchikawaththa/pages/Root.dart';
import 'package:panchikawaththa/pages/SpashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/main_layout.dart';
import 'package:panchikawaththa/pages/profile_page.dart';
import 'package:panchikawaththa/pages/edit_profile_page.dart';

void main() => runApp(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/splash',
            routes: {
              '/splash': (context) => const SplashScreen(),
              '/home_page': (context) => const MainLayout(),
              // '/profile': (context) => const Profilepage(),
              // '/edit_profile': (context) => const UserProfileEditScreen(),
            },
          );
        },
      ),
    );

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           backgroundColor: Color.fromRGBO(1, 1, 1, 1),
//           body: Center(
//             //child: Text(
//             //'Digital Panchikawatta',
//             // style: TextStyle(
//             // fontSize: 24,
//             // fontWeight: FontWeight.bold,
//             // color: Color.fromRGBO(255, 255, 255, 1),
//             //),
//             child: Image(
//               image: AssetImage('assets/logo.png'),
//             ),
//           )), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // iPhone X design reference
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spare Parts UI',
          theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          home: const MainLayout(), // This now wraps all bottom nav pages
        );
      },
    );
  }
}
