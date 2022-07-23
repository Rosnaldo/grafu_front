class Lot {
  double price;
  int vacancyExistent;
  int vacancyFilled;

  Lot({
    required this.price,
    required this.vacancyExistent,
    required this.vacancyFilled,
  });

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'vacancyExistent': vacancyExistent,
      'vacancyFilled': vacancyFilled,
    };
  }

  factory Lot.fromMap(Map<String, dynamic> map) {
    return Lot(
      price: map['price'] ?? '',
      vacancyExistent: map['vacancyExistent'] ?? '',
      vacancyFilled: map['vacancyFilled'] ?? '',
    );
  }
}
