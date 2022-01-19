import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transtour_application/src/service/http_service.dart';
import 'package:transtour_application/src/widget/background.dart';
import 'package:transtour_application/src/widget/card_table.dart';
import 'package:transtour_application/src/widget/custom_bottom_navigation.dart';
import 'package:transtour_application/src/widget/page_title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpService authProvider = Provider.of(context);

    if (authProvider.isAuthenticated) {
      return Scaffold(
        body: Stack(
          children: [
            // Background
            Background(),
            // Home Body
            _HomeBody()
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(),
      );
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/login.png'),
            SizedBox(
              height: 32,
            ),
            Text(
              "Login to continue\nClick on floating action button to sign in anonymously.",
              textAlign: TextAlign.center,
            )
          ]);
    }
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Titulos
          PageTitle(),

          // Card Table
          CardTable(),
        ],
      ),
    );
  }
}
