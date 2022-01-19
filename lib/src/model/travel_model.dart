class Travel {
  late int orderNumber;
  late DateTime date;
  late String passanger;
  late String origin;
  late String destiny;
  late String company;
  late String? obsevation;
  late double toll;
  late double parking;
  late double waitingTime;

  Travel({
    required this.orderNumber,
    required this.date,
    required this.passanger,
    required this.destiny,
    required this.company,
    this.obsevation,
    required this.toll,
    required this.parking,
    required this.waitingTime,
  });

  Travel.fromJson(Map<String, dynamic> json)
      : orderNumber = json['orderNumber'],
        date = json['date'],
        company = json['company'],
        destiny = json['destiny'],
        obsevation = json['obsevation'],
        toll = double.tryParse(json['toll']) ?? 0.0,
        parking = double.parse(json['parking']) ?? 0.0,
        waitingTime = double.parse(json['withiTime']) ?? 0.0;

    Map<String, dynamic> toJson() => {
      'orderNumber': orderNumber,
      'date': date,
    };

    
}
