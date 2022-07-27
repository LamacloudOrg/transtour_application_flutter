import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:transtour_application/src/screens/checking_autentication/checking_authentication_screen.dart';
import 'package:transtour_application/src/screens/home/home_screen.dart';
import 'package:transtour_application/src/screens/login/login_screen.dart';
import 'package:transtour_application/src/screens/signature/signature_page.dart';
import 'package:transtour_application/src/screens/travel/travel.dart';
import 'package:transtour_application/src/service/autentication_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationService()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Transtour App',
            initialRoute: 'checking',
            routes: {
              'checking': (_) => const CheckingAuthentication(),
              'login': (_) => const LoginScreen(),
              'logout': (_) => const LoginScreen(),
              'home_screen': (_) => HomeScreen(),
              'travel': (_) => Travel(),
              'signature': (_) => SignaturePage()
            }));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
