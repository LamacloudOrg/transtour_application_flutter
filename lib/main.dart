import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:transtour_application/src/screens/home_screen.dart';
import 'package:transtour_application/src/screens/login.dart';
import 'package:transtour_application/src/screens/travel.dart';
import 'package:transtour_application/src/service/http_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => HttpService())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Transtour App',
            initialRoute: 'login',
            routes: {
              'home_screen': (_) => HomeScreen(),
              'login': (_) => Login(),
              'travel': (_) => Travel()
            }));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
