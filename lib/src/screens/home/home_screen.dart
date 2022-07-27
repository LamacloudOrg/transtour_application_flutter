import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transtour_application/src/service/autentication_service.dart';
import 'package:transtour_application/src/widget/background.dart';
import 'package:transtour_application/src/widget/card_table.dart';
import 'package:transtour_application/src/widget/custom_bottom_navigation.dart';
import 'package:transtour_application/src/widget/page_title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<AuthenticationService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.logout_sharp),
              onPressed: () {
                service.logout();
                Navigator.pushReplacementNamed(context, 'login');
              }),
          centerTitle: true,
          title: Text(
            'Transtour',
            style: TextStyle(color: Colors.blueGrey[600], fontSize: 18),
          )),
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
