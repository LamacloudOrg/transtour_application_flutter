import 'package:transtour_application/src/model/travel_model.dart';

class TravelTaxes {
  late String? obsevation;
  late double toll;
  late double parking;
  late double waitingTime;

  TravelTaxes({
    required this.toll,
    required this.parking,
    required this.waitingTime,
  });

  TravelTaxes.fromTravel(Travel t)
      : obsevation = t.obsevation,
        toll = t.toll,
        parking = t.parking,
        waitingTime = t.waitingTime;

  Map<String, dynamic> toJson() => {
        'obsevation': obsevation,
        'toll': toll,
        'parking': parking,
        'waitingTime': waitingTime
      };
}
