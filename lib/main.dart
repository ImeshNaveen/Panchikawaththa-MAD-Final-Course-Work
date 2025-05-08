import 'package:flutter/material.dart';
import 'package:panchikawaththa/pages/Root.dart';
import 'package:panchikawaththa/pages/SpashScreen.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
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
