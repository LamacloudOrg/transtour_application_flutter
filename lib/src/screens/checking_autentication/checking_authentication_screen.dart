import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transtour_application/src/screens/home/home_screen.dart';
import 'package:transtour_application/src/screens/login/login_screen.dart';
import 'package:transtour_application/src/service/autentication_service.dart';

class CheckingAuthentication extends StatelessWidget {
  const CheckingAuthentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<AuthenticationService>(context, listen: false);

    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: service.readToken(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Espere por favor!");
                  }

                  if (snapshot.data == '') {
                    Future.microtask(() {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const LoginScreen(),
                              transitionDuration: Duration(seconds: 0)));
                    });
                  } else {
                    Future.microtask(() {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => HomeScreen(),
                              transitionDuration: Duration(seconds: 0)));
                    });
                  }
                  return const Center();
                })));
  }
}
