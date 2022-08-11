import 'package:grafu/models/address.dart';
import 'package:grafu/models/convenience.dart';
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
      conveniences: [
        Convenience(
          type: ConvenienceType.park,
          items: ['Churrasqueira', 'jardim'],
        ),
        Convenience(
          type: ConvenienceType.food,
          items: ['Café da manhã', 'Almoço', 'janta'],
        ),
        Convenience(
          type: ConvenienceType.internet,
          items: ['Cobertura total de internet wireless'],
        ),
        Convenience(
          type: ConvenienceType.sleep,
          items: ['Quarto individual', 'Chuveiro'],
        ),
        Convenience(
          type: ConvenienceType.parking,
          items: ['Vagas para 10 carros'],
        ),
        Convenience(
          type: ConvenienceType.pool,
          items: ['Piscina para criança'],
        ),
      ],
      gallery: [
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      ],
    );
  }
}
