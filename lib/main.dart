import 'package:cryptoinfo/utils/size_utils.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/pages/home.dart';

void main() {
  runApp(const CryptoInfoApp());
}

class CryptoInfoApp extends StatelessWidget {
  const CryptoInfoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Info',
      theme: ThemeData(
        brightness: Brightness.dark,
        buttonBarTheme: const ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
        ),
        cardColor: const Color.fromARGB(255, 25, 26, 27),
        dialogBackgroundColor: const Color.fromARGB(255, 25, 26, 27),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: Colors.white,
          color: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
            opacity: 1.0,
          ),
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
          opacity: 1.0,
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ),
        hintColor: const Color.fromARGB(255, 102, 101, 101),
        primaryColor: const Color.fromARGB(255, 255, 253, 253),
        disabledColor: const Color.fromARGB(255, 70, 75, 78),
        indicatorColor: const Color.fromARGB(255, 67, 83, 255),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
      ),
      home: const HomePage(title: 'Crypto Info'),
    );
  }
}
