import 'package:json_annotation/json_annotation.dart';
import 'package:grafu/models/address.dart';
import 'package:grafu/models/convenience.dart';
import 'package:grafu/models/lot.dart';

part 'playday.g.dart';

@JsonSerializable()
class Playday {
  String date;
  Address address;
  Lot firstLot;
  Lot? secoundLot;
  Lot? thirdLot;
  Lot? fourthLot;
  Lot? fifthLot;
  List<String> gallery;
  List<Convenience> conveniences;

  Playday({
    required this.date,
    required this.address,
    required this.gallery,
    required this.firstLot,
    this.secoundLot,
    this.thirdLot,
    this.fourthLot,
    this.fifthLot,
    required this.conveniences,
  });

  factory Playday.fromJson(Map<String, dynamic> json) =>
      _$PlaydayFromJson(json);

  Map<String, dynamic> toJson() => _$PlaydayToJson(this);
}
