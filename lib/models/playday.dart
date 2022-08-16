import 'package:grafu/models/participant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:grafu/models/address.dart';
import 'package:grafu/models/convenience.dart';
import 'package:grafu/models/lot.dart';

class Playday {
  String id;
  String date;
  Address address;
  Lot firstLot;
  Lot? secoundLot;
  Lot? thirdLot;
  Lot? fourthLot;
  Lot? fifthLot;
  List<String> gallery;
  List<Convenience> conveniences;
  @JsonKey(name: 'Participants')
  List<Participant> participants;

  Playday({
    required this.id,
    required this.date,
    required this.address,
    required this.gallery,
    required this.firstLot,
    this.secoundLot,
    this.thirdLot,
    this.fourthLot,
    this.fifthLot,
    required this.conveniences,
    required this.participants,
  });
}
