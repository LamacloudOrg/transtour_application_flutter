import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? icon;

  const CustomInputField({
    Key? key,
    this.labelText,
    this.hintText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.cyan),
          icon: icon == null
              ? null
              : Icon(
                  icon,
                  color: Colors.cyan,
                ),
          floatingLabelStyle: TextStyle(color: Colors.pinkAccent),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
    );
  }
}
