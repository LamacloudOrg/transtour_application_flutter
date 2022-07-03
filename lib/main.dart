import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transtour_application/src/screens/home/home_screen.dart';
import 'package:transtour_application/src/screens/login/login.dart';
import 'package:transtour_application/src/screens/signature/signature_page.dart';
import 'package:transtour_application/src/screens/travel/travel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transtour App',
        initialRoute: 'signature',
        routes: {
          'home_screen': (_) => HomeScreen(),
          'login': (_) => Login(),
          'travel': (_) => Travel(),
          'signature': (_) => SignaturePage()
        });

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
