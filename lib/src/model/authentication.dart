class Authentication {
  int dni;
  String password;

  Authentication({
    required this.dni,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "dni": dni,
        "password": password,
      };
}
