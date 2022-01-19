class Authentication {
  late int dni;
  late String password;

  Authentication({required this.dni, required this.password});

  Map<String, dynamic> toJson() => {'dni': dni, 'password': password};
}
