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

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'address': address,
      'gallery': gallery,
      'firstLot': firstLot,
      'secoundLot': secoundLot,
      'thirdLot': thirdLot,
      'fourthLot': fourthLot,
      'fifthLot': fifthLot,
    };
  }

  factory Playday.fromMap(Map<String, dynamic> map) {
    return Playday(
      date: map['date'] ?? '',
      address: Address.fromMap(map['address']),
      gallery: map['gallery'] ?? [],
      firstLot: Lot.fromMap(map['firstLot']),
      secoundLot: Lot.fromMap(map['secoundLot']),
      thirdLot: Lot.fromMap(map['thirdLot']),
      fourthLot: Lot.fromMap(map['fourthLot']),
      fifthLot: Lot.fromMap(map['fifthLot']),
    );
  }
}
