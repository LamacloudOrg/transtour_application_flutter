import 'package:flutter/material.dart';
import 'package:transtour_application/src/widget/background.dart';
import 'package:transtour_application/src/widget/background_page.dart';
import 'package:transtour_application/src/widget/forms/custom_input_field.dart';

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text(
          'VIAJE ACTUAL',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        automaticallyImplyLeading: true, // remove back button in appbar.
      ),
      body: Container(
        color: Color(0xff202333),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                CustomInputField(
                    labelText: 'Fecha',
                    hintText: '25/01/2022',
                    icon: Icons.date_range),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Pasajero',
                    hintText: 'Diego Maradona',
                    icon: Icons.person),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Empresa',
                    hintText: 'Covance',
                    icon: Icons.emoji_transportation_outlined),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Origen',
                    hintText: 'Calle 4',
                    icon: Icons.font_download_outlined),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Destino',
                    hintText: 'Calle 5',
                    icon: Icons.arrow_right_alt_rounded),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Consideraciones',
                    hintText: 'Consideraciones',
                    icon: Icons.format_list_bulleted_rounded),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Peaje',
                    hintText: 'Peaje',
                    icon: Icons.toll_outlined),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Costo estacionamiento',
                    hintText: 'Costo estacionamiento',
                    icon: Icons.local_parking_rounded),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Horas',
                    hintText: '13:45',
                    icon: Icons.av_timer_outlined),
                SizedBox(height: 10),
                CustomInputField(
                    labelText: 'Costo vuelta',
                    hintText: 'Costo vuelta',
                    icon: Icons.keyboard_return_outlined),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), label: 'INICIAR VIAJE'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stop), label: 'FINALIZAR VIAJE'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'FIRMAR'),
        ],
      ),
    );
  }
}
