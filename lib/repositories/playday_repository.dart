import 'package:grafu/models/playday.dart';

class PlaydayRepository {
  Future<Playday> get() async {
    const response = {
      "date": "10 de julho de 2022, 15h - 14 de agosto de 2022, 19h",
      "address": {
        "district": "Alphaville / Lagoa dos Ingleses",
        "street": "Av. Picadilly",
        "city": "Nova Lima",
        "state": "MG",
      },
      "firstLot": {
        "price": 10.0,
        "vacancyExistent": 10,
        "vacancyFilled": 2,
      },
      "secoundLot": {
        "price": 20.0,
        "vacancyExistent": 10,
        "vacancyFilled": 0,
      },
      "thirdLot": {
        "price": 30.0,
        "vacancyExistent": 10,
        "vacancyFilled": 0,
      },
      "gallery": [
        "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
        "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
        "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80",
      ]
    };
    await Future.delayed(const Duration(seconds: 1));

    return Playday.fromMap(response);
  }
}
