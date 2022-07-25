import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SigleCard(
              color: Colors.blue,
              icon: Icons.notification_add,
              text: 'Notificaciones',
              action: ''),
          _SigleCard(
              color: Colors.cyan,
              icon: Icons.car_rental,
              text: 'Viaje actual',
              action: 'travel'),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.green,
              icon: Icons.shop,
              text: 'Vouchers',
              action: ''),
          _SigleCard(
              color: Colors.purpleAccent,
              icon: Icons.cloud,
              text: 'Facturacion',
              action: ''),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.yellow,
              icon: Icons.movie,
              text: 'Lista Viajes',
              action: ''),
          _SigleCard(
              color: Colors.pinkAccent,
              icon: Icons.food_bank_outlined,
              text: 'Tengo Problemas',
              action: ''),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.blue,
              icon: Icons.border_all,
              text: 'WhatsApp',
              action: ''),
          _SigleCard(
              color: Colors.blueGrey,
              icon: Icons.car_rental,
              text: 'Mapa',
              action: ''),
        ]),
      ],
    );
  }
}

class _SigleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String action;

  const _SigleCard(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: this.color,
              child: Icon(
                this.icon,
                size: 35,
                color: Colors.white,
              ),
              radius: 30,
            ),
            SizedBox(height: 10),
            Text(
              this.text,
              style: TextStyle(color: this.color, fontSize: 18),
            )
          ],
        ),
        voidCallback: () {
          Navigator.pushReplacementNamed(context, this.action);
        });
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final VoidCallback voidCallback;

  const _CardBackground(
      {Key? key, required this.child, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            onTap: voidCallback,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 66, 107, 0.7),
                  borderRadius: BorderRadius.circular(20)),
              child: this.child,
            ),
          ),
        ),
      ),
    );
  }
}
