import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';

enum ConvenienceType {
  park,
  food,
  internet,
  sleep,
  parking,
  pool,
  notFound,
}

class Convenience extends Equatable {
  final ConvenienceType type;
  final List<String> items;

  const Convenience({
    required this.type,
    required this.items,
  });

  get title => mapTypeToTitle(type);
  get icon => mapTypeToIcon(type);

  String mapTypeToTitle(ConvenienceType type) {
    Map<ConvenienceType, String> map = {
      ConvenienceType.park: 'Ao ar livre',
      ConvenienceType.food: 'Refeição',
      ConvenienceType.internet: 'Internet',
      ConvenienceType.sleep: 'Acomodação',
      ConvenienceType.parking: 'Estacionamento',
      ConvenienceType.pool: 'Piscina',
    };

    final title = map[type];

    if (title == null) {
      return 'not_found';
    }

    return title;
  }

  Icon mapTypeToIcon(ConvenienceType type) {
    Map<ConvenienceType, Icon> map = {
      ConvenienceType.park: const Icon(Icons.park, color: mainText),
      ConvenienceType.food: const Icon(Icons.restaurant_menu, color: mainText),
      ConvenienceType.internet: const Icon(Icons.wifi, color: mainText),
      ConvenienceType.sleep:
          const Icon(Icons.airline_seat_individual_suite, color: mainText),
      ConvenienceType.parking:
          const Icon(Icons.directions_car_filled, color: mainText),
      ConvenienceType.pool: const Icon(Icons.pool, color: mainText),
    };

    final icon = map[type];

    if (icon == null) {
      return const Icon(Icons.disabled_by_default);
    }

    return icon;
  }

  @override
  List<Object?> get props => [
        type,
        items,
      ];

  @override
  bool get stringify => true;
}
