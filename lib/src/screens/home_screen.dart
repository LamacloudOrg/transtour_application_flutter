import 'package:flutter/material.dart';
import 'package:transtour_application/src/widget/background.dart';
import 'package:transtour_application/src/widget/card_table.dart';
import 'package:transtour_application/src/widget/custom_bottom_navigation.dart';
import 'package:transtour_application/src/widget/page_title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
