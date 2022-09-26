import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:grafu/models/address.dart';
import 'package:grafu/models/avatar.dart';
import 'package:grafu/models/convenience.dart';
import 'package:grafu/models/lot.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/repositories/playday/mapper.dart';

void main() {
  test('ResponsePlaydayMapper', () {
    final playdayjson = {
      "id": "1bb79eaa-457f-4380-acaa-c7af614668cf",
      "date": "10 de julho de 2022, 15h - 14 de agosto de 2022, 19h",
      "adminId": "63aa07c0-6c2b-4c18-947f-959718eed5a4",
      "address_district": "Alphaville / Lagoa dos Ingleses",
      "address_street": "Nova Lima",
      "address_city": "Nova Lima",
      "address_state": "MG",
      "lot1_price": 10,
      "lot1_vacancy_existent": 10,
      "lot1_vacancy_filled": 1,
      "lot2_price": 20,
      "lot2_vacancy_existent": 10,
      "lot2_vacancy_filled": 0,
      "lot3_price": 30,
      "lot3_vacancy_existent": 10,
      "lot3_vacancy_filled": 0,
      "lot4_price": null,
      "lot4_vacancy_existent": null,
      "lot4_vacancy_filled": null,
      "lot5_price": null,
      "lot5_vacancy_existent": null,
      "lot5_vacancy_filled": null,
      "gallery": [
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      ],
      "convenience_park": ["Churrasqueira", "jardim"],
      "convenience_food": ["Café da manhã", "Almoço", "janta"],
      "convenience_internet": ["Cobertura total de internet wireless"],
      "convenience_sleep": ["Quarto individual", "Chuveiro"],
      "convenience_parking": ["Vagas para 10 carros"],
      "convenience_pool": ["Piscina para criança"],
      "participants": [
        {
          "id": "70c7482f-b0bc-450d-b393-04207e03fc21",
          "userId": "63aa07c0-6c2b-4c18-947f-959718eed5a4",
          "playdayId": "1bb79eaa-457f-4380-acaa-c7af614668cf",
          "status": "confirmed",
          "user": {
            "id": "63aa07c0-6c2b-4c18-947f-959718eed5a4",
            "name": "Andrey Tsuzuki",
            "email": "andreytsuzuki@gmail.com",
            "avatarUrl":
                "https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0",
            "avatarUuid": "C4D03AQFXAsqjqMZjSw"
          }
        },
      ]
    };

    final jsonS = json.encode(playdayjson);

    final playday = ResponsePlaydayMapper.jsonToEntity(jsonS);

    expect(
        playday,
        equals(
          const Playday(
            id: '1bb79eaa-457f-4380-acaa-c7af614668cf',
            adminId: '63aa07c0-6c2b-4c18-947f-959718eed5a4',
            date: '10 de julho de 2022, 15h - 14 de agosto de 2022, 19h',
            address: Address(
              district: 'Alphaville / Lagoa dos Ingleses',
              street: 'Nova Lima',
              city: 'Nova Lima',
              state: 'MG',
            ),
            firstLot: Lot(
              price: 10,
              vacancyExistent: 10,
              vacancyFilled: 1,
            ),
            secoundLot: Lot(
              price: 20,
              vacancyExistent: 10,
              vacancyFilled: 0,
            ),
            thirdLot: Lot(
              price: 30,
              vacancyExistent: 10,
              vacancyFilled: 0,
            ),
            gallery: [
              'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
            ],
            conveniences: [
              Convenience(
                  type: ConvenienceType.park,
                  items: ['Churrasqueira', 'jardim']),
              Convenience(
                  type: ConvenienceType.food,
                  items: ['Café da manhã', 'Almoço', 'janta']),
              Convenience(
                  type: ConvenienceType.internet,
                  items: ['Cobertura total de internet wireless']),
              Convenience(
                  type: ConvenienceType.parking,
                  items: ['Vagas para 10 carros']),
              Convenience(
                  type: ConvenienceType.pool, items: ['Piscina para criança']),
              Convenience(
                  type: ConvenienceType.sleep,
                  items: ['Quarto individual', 'Chuveiro']),
            ],
            participants: [
              Participant(
                id: '70c7482f-b0bc-450d-b393-04207e03fc21',
                email: 'andreytsuzuki@gmail.com',
                name: 'Andrey Tsuzuki',
                avatar: Avatar(
                  url:
                      'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
                  uuid: 'C4D03AQFXAsqjqMZjSw',
                ),
                status: ParticipantStatus.confirmed,
              )
            ],
          ),
        ));
  });
}
