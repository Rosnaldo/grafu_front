import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String district;
  final String street;
  final String city;
  final String state;

  const Address({
    required this.district,
    required this.street,
    required this.city,
    required this.state,
  });

  @override
  List<Object?> get props => [
        district,
        street,
        city,
        state,
      ];

  @override
  bool get stringify => true;
}
