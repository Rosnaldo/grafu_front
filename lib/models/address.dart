class Address {
  String district;
  String street;
  String city;
  String state;

  Address({
    required this.district,
    required this.street,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      'district': district,
      'street': street,
      'city': city,
      'state': state,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      district: map['district'] ?? '',
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
    );
  }
}
