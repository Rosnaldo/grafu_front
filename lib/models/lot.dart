import 'package:equatable/equatable.dart';

class Lot extends Equatable {
  final int price;
  final int vacancyExistent;
  final int vacancyFilled;

  const Lot({
    required this.price,
    required this.vacancyExistent,
    required this.vacancyFilled,
  });

  @override
  List<Object?> get props => [
        price,
        vacancyExistent,
        vacancyFilled,
      ];

  @override
  bool get stringify => true;
}
