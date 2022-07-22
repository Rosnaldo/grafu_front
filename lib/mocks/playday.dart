import 'package:grafu/models/address.dart';
import 'package:grafu/models/lot.dart';
import 'package:grafu/models/playday.dart';

class MakePlayday {
  static Playday make() {
    return Playday(
      date: '10 de julho de 2022, 15h - 14 de agosto de 2022, 19h',
      address: Address(
        district: 'Alphaville / Lagoa dos Ingleses',
        street: 'Av. Picadilly',
        city: 'Nova Lima',
        state: 'MG',
      ),
      firstLot: Lot(
        price: 10.0,
        vacancyExistent: 10,
        vacancyFilled: 2,
      ),
      secoundLot: Lot(
        price: 20.0,
        vacancyExistent: 10,
        vacancyFilled: 0,
      ),
      thirdLot: Lot(
        price: 30.0,
        vacancyExistent: 10,
        vacancyFilled: 0,
      ),
      gallery: [
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      ],
    );
  }
}
