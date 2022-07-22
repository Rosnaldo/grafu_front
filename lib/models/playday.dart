import 'package:grafu/models/address.dart';
import 'package:grafu/models/lot.dart';

class Playday {
  String date;
  Address address;
  Lot firstLot;
  Lot? secoundLot;
  Lot? thirdLot;
  Lot? fourthLot;
  Lot? fifthLot;
  List<String> gallery;

  Playday({
    required this.date,
    required this.address,
    required this.gallery,
    required this.firstLot,
    this.secoundLot,
    this.thirdLot,
    this.fourthLot,
    this.fifthLot,
  });
}
