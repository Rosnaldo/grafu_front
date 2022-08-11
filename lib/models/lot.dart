import 'package:json_annotation/json_annotation.dart';

part 'lot.g.dart';

@JsonSerializable()
class Lot {
  double price;
  int vacancyExistent;
  int vacancyFilled;

  Lot({
    required this.price,
    required this.vacancyExistent,
    required this.vacancyFilled,
  });

  factory Lot.fromJson(Map<String, dynamic> json) => _$LotFromJson(json);

  Map<String, dynamic> toJson() => _$LotToJson(this);
}
