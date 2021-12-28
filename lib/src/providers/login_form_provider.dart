import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String user = '';
  String pass = '';

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
