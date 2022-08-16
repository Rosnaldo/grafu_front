import 'package:grafu/models/address.dart';
import 'package:grafu/models/convenience.dart';
import 'package:grafu/models/lot.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/repositories/participant/mapper.dart';
import 'package:grafu/repositories/participant/response_participant.dart';
import 'package:grafu/repositories/playday/response_playday.dart';

class ResponsePlaydayMapper {
  static Playday jsonToEntity(String jsonS) {
    final responsePlayday = ResponsePlayday.fromJson(jsonS);

    return ResponsePlaydayMapper.toEntity(responsePlayday);
  }

  static Playday toEntity(ResponsePlayday r) {
    return Playday(
        id: r.id,
        date: r.date,
        address: Address(
          city: r.addressCity,
          district: r.addressDistrict,
          state: r.addressState,
          street: r.addressStreet,
        ),
        firstLot: Lot(
          price: r.lot1Price,
          vacancyExistent: r.lot1VacancyExistent,
          vacancyFilled: r.lot1VacancyFilled,
        ),
        secoundLot: (r.lot2Price != null)
            ? Lot(
                price: r.lot2Price!,
                vacancyExistent: r.lot2VacancyExistent!,
                vacancyFilled: r.lot2VacancyFilled!,
              )
            : null,
        thirdLot: (r.lot3Price != null)
            ? Lot(
                price: r.lot3Price!,
                vacancyExistent: r.lot3VacancyExistent!,
                vacancyFilled: r.lot3VacancyFilled!,
              )
            : null,
        fourthLot: (r.lot4Price != null)
            ? Lot(
                price: r.lot4Price!,
                vacancyExistent: r.lot4VacancyExistent!,
                vacancyFilled: r.lot4VacancyFilled!,
              )
            : null,
        fifthLot: (r.lot5Price != null)
            ? Lot(
                price: r.lot5Price!,
                vacancyExistent: r.lot5VacancyExistent!,
                vacancyFilled: r.lot5VacancyFilled!,
              )
            : null,
        gallery: r.gallery.toList(),
        participants: mapParticipants(r.participants.toList()),
        conveniences: [
          Convenience(
            items: r.conveniencePark.toList(),
            type: ConvenienceType.park,
          ),
          Convenience(
            items: r.convenienceFood.toList(),
            type: ConvenienceType.food,
          ),
          Convenience(
            items: r.convenienceInternet.toList(),
            type: ConvenienceType.internet,
          ),
          Convenience(
            items: r.convenienceParking.toList(),
            type: ConvenienceType.parking,
          ),
          Convenience(
            items: r.conveniencePool.toList(),
            type: ConvenienceType.pool,
          ),
          Convenience(
            items: r.convenienceSleep.toList(),
            type: ConvenienceType.sleep,
          ),
        ]);
  }

  static mapParticipants(List<ResponseParticipant> l) {
    return l.map((p) => ParticipantResponseMapper.toEntity(p)).toList();
  }
}
