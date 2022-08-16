import 'package:equatable/equatable.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/models/address.dart';
import 'package:grafu/models/convenience.dart';
import 'package:grafu/models/lot.dart';

class Playday extends Equatable {
  final String id;
  final String date;
  final Address address;
  final Lot firstLot;
  final Lot? secoundLot;
  final Lot? thirdLot;
  final Lot? fourthLot;
  final Lot? fifthLot;
  final List<String> gallery;
  final List<Convenience> conveniences;
  final List<Participant> participants;

  const Playday({
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

  @override
  List<Object?> get props => [
        id,
        date,
        address,
        gallery,
        firstLot,
        secoundLot,
        thirdLot,
        fourthLot,
        fifthLot,
        conveniences,
        participants
      ];

  @override
  bool get stringify => true;
}
