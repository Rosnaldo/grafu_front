// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_playday.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponsePlayday> _$responsePlaydaySerializer =
    new _$ResponsePlaydaySerializer();

class _$ResponsePlaydaySerializer
    implements StructuredSerializer<ResponsePlayday> {
  @override
  final Iterable<Type> types = const [ResponsePlayday, _$ResponsePlayday];
  @override
  final String wireName = 'ResponsePlayday';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResponsePlayday object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'adminId',
      serializers.serialize(object.adminId,
          specifiedType: const FullType(String)),
      'address_district',
      serializers.serialize(object.addressDistrict,
          specifiedType: const FullType(String)),
      'address_street',
      serializers.serialize(object.addressStreet,
          specifiedType: const FullType(String)),
      'address_city',
      serializers.serialize(object.addressCity,
          specifiedType: const FullType(String)),
      'address_state',
      serializers.serialize(object.addressState,
          specifiedType: const FullType(String)),
      'lot1_price',
      serializers.serialize(object.lot1Price,
          specifiedType: const FullType(int)),
      'lot1_vacancy_existent',
      serializers.serialize(object.lot1VacancyExistent,
          specifiedType: const FullType(int)),
      'lot1_vacancy_filled',
      serializers.serialize(object.lot1VacancyFilled,
          specifiedType: const FullType(int)),
      'gallery',
      serializers.serialize(object.gallery,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'convenience_park',
      serializers.serialize(object.conveniencePark,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'convenience_food',
      serializers.serialize(object.convenienceFood,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'convenience_internet',
      serializers.serialize(object.convenienceInternet,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'convenience_sleep',
      serializers.serialize(object.convenienceSleep,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'convenience_parking',
      serializers.serialize(object.convenienceParking,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'convenience_pool',
      serializers.serialize(object.conveniencePool,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'participants',
      serializers.serialize(object.participants,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ResponseParticipant)])),
    ];
    Object? value;
    value = object.lot2Price;
    if (value != null) {
      result
        ..add('lot2_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot2VacancyExistent;
    if (value != null) {
      result
        ..add('lot2_vacancy_existent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot2VacancyFilled;
    if (value != null) {
      result
        ..add('lot2_vacancy_filled')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot3Price;
    if (value != null) {
      result
        ..add('lot3_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot3VacancyExistent;
    if (value != null) {
      result
        ..add('lot3_vacancy_existent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot3VacancyFilled;
    if (value != null) {
      result
        ..add('lot3_vacancy_filled')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot4Price;
    if (value != null) {
      result
        ..add('lot4_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot4VacancyExistent;
    if (value != null) {
      result
        ..add('lot4_vacancy_existent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot4VacancyFilled;
    if (value != null) {
      result
        ..add('lot4_vacancy_filled')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot5Price;
    if (value != null) {
      result
        ..add('lot5_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot5VacancyExistent;
    if (value != null) {
      result
        ..add('lot5_vacancy_existent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lot5VacancyFilled;
    if (value != null) {
      result
        ..add('lot5_vacancy_filled')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ResponsePlayday deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponsePlaydayBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'adminId':
          result.adminId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address_district':
          result.addressDistrict = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address_street':
          result.addressStreet = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address_city':
          result.addressCity = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address_state':
          result.addressState = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lot1_price':
          result.lot1Price = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'lot1_vacancy_existent':
          result.lot1VacancyExistent = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'lot1_vacancy_filled':
          result.lot1VacancyFilled = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'lot2_price':
          result.lot2Price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot2_vacancy_existent':
          result.lot2VacancyExistent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot2_vacancy_filled':
          result.lot2VacancyFilled = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot3_price':
          result.lot3Price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot3_vacancy_existent':
          result.lot3VacancyExistent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot3_vacancy_filled':
          result.lot3VacancyFilled = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot4_price':
          result.lot4Price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot4_vacancy_existent':
          result.lot4VacancyExistent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot4_vacancy_filled':
          result.lot4VacancyFilled = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot5_price':
          result.lot5Price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot5_vacancy_existent':
          result.lot5VacancyExistent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lot5_vacancy_filled':
          result.lot5VacancyFilled = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gallery':
          result.gallery.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'convenience_park':
          result.conveniencePark.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'convenience_food':
          result.convenienceFood.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'convenience_internet':
          result.convenienceInternet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'convenience_sleep':
          result.convenienceSleep.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'convenience_parking':
          result.convenienceParking.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'convenience_pool':
          result.conveniencePool.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'participants':
          result.participants.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ResponseParticipant)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ResponsePlayday extends ResponsePlayday {
  @override
  final String id;
  @override
  final String date;
  @override
  final String adminId;
  @override
  final String addressDistrict;
  @override
  final String addressStreet;
  @override
  final String addressCity;
  @override
  final String addressState;
  @override
  final int lot1Price;
  @override
  final int lot1VacancyExistent;
  @override
  final int lot1VacancyFilled;
  @override
  final int? lot2Price;
  @override
  final int? lot2VacancyExistent;
  @override
  final int? lot2VacancyFilled;
  @override
  final int? lot3Price;
  @override
  final int? lot3VacancyExistent;
  @override
  final int? lot3VacancyFilled;
  @override
  final int? lot4Price;
  @override
  final int? lot4VacancyExistent;
  @override
  final int? lot4VacancyFilled;
  @override
  final int? lot5Price;
  @override
  final int? lot5VacancyExistent;
  @override
  final int? lot5VacancyFilled;
  @override
  final BuiltList<String> gallery;
  @override
  final BuiltList<String> conveniencePark;
  @override
  final BuiltList<String> convenienceFood;
  @override
  final BuiltList<String> convenienceInternet;
  @override
  final BuiltList<String> convenienceSleep;
  @override
  final BuiltList<String> convenienceParking;
  @override
  final BuiltList<String> conveniencePool;
  @override
  final BuiltList<ResponseParticipant> participants;

  factory _$ResponsePlayday([void Function(ResponsePlaydayBuilder)? updates]) =>
      (new ResponsePlaydayBuilder()..update(updates))._build();

  _$ResponsePlayday._(
      {required this.id,
      required this.date,
      required this.adminId,
      required this.addressDistrict,
      required this.addressStreet,
      required this.addressCity,
      required this.addressState,
      required this.lot1Price,
      required this.lot1VacancyExistent,
      required this.lot1VacancyFilled,
      this.lot2Price,
      this.lot2VacancyExistent,
      this.lot2VacancyFilled,
      this.lot3Price,
      this.lot3VacancyExistent,
      this.lot3VacancyFilled,
      this.lot4Price,
      this.lot4VacancyExistent,
      this.lot4VacancyFilled,
      this.lot5Price,
      this.lot5VacancyExistent,
      this.lot5VacancyFilled,
      required this.gallery,
      required this.conveniencePark,
      required this.convenienceFood,
      required this.convenienceInternet,
      required this.convenienceSleep,
      required this.convenienceParking,
      required this.conveniencePool,
      required this.participants})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ResponsePlayday', 'id');
    BuiltValueNullFieldError.checkNotNull(date, r'ResponsePlayday', 'date');
    BuiltValueNullFieldError.checkNotNull(
        adminId, r'ResponsePlayday', 'adminId');
    BuiltValueNullFieldError.checkNotNull(
        addressDistrict, r'ResponsePlayday', 'addressDistrict');
    BuiltValueNullFieldError.checkNotNull(
        addressStreet, r'ResponsePlayday', 'addressStreet');
    BuiltValueNullFieldError.checkNotNull(
        addressCity, r'ResponsePlayday', 'addressCity');
    BuiltValueNullFieldError.checkNotNull(
        addressState, r'ResponsePlayday', 'addressState');
    BuiltValueNullFieldError.checkNotNull(
        lot1Price, r'ResponsePlayday', 'lot1Price');
    BuiltValueNullFieldError.checkNotNull(
        lot1VacancyExistent, r'ResponsePlayday', 'lot1VacancyExistent');
    BuiltValueNullFieldError.checkNotNull(
        lot1VacancyFilled, r'ResponsePlayday', 'lot1VacancyFilled');
    BuiltValueNullFieldError.checkNotNull(
        gallery, r'ResponsePlayday', 'gallery');
    BuiltValueNullFieldError.checkNotNull(
        conveniencePark, r'ResponsePlayday', 'conveniencePark');
    BuiltValueNullFieldError.checkNotNull(
        convenienceFood, r'ResponsePlayday', 'convenienceFood');
    BuiltValueNullFieldError.checkNotNull(
        convenienceInternet, r'ResponsePlayday', 'convenienceInternet');
    BuiltValueNullFieldError.checkNotNull(
        convenienceSleep, r'ResponsePlayday', 'convenienceSleep');
    BuiltValueNullFieldError.checkNotNull(
        convenienceParking, r'ResponsePlayday', 'convenienceParking');
    BuiltValueNullFieldError.checkNotNull(
        conveniencePool, r'ResponsePlayday', 'conveniencePool');
    BuiltValueNullFieldError.checkNotNull(
        participants, r'ResponsePlayday', 'participants');
  }

  @override
  ResponsePlayday rebuild(void Function(ResponsePlaydayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponsePlaydayBuilder toBuilder() =>
      new ResponsePlaydayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponsePlayday &&
        id == other.id &&
        date == other.date &&
        adminId == other.adminId &&
        addressDistrict == other.addressDistrict &&
        addressStreet == other.addressStreet &&
        addressCity == other.addressCity &&
        addressState == other.addressState &&
        lot1Price == other.lot1Price &&
        lot1VacancyExistent == other.lot1VacancyExistent &&
        lot1VacancyFilled == other.lot1VacancyFilled &&
        lot2Price == other.lot2Price &&
        lot2VacancyExistent == other.lot2VacancyExistent &&
        lot2VacancyFilled == other.lot2VacancyFilled &&
        lot3Price == other.lot3Price &&
        lot3VacancyExistent == other.lot3VacancyExistent &&
        lot3VacancyFilled == other.lot3VacancyFilled &&
        lot4Price == other.lot4Price &&
        lot4VacancyExistent == other.lot4VacancyExistent &&
        lot4VacancyFilled == other.lot4VacancyFilled &&
        lot5Price == other.lot5Price &&
        lot5VacancyExistent == other.lot5VacancyExistent &&
        lot5VacancyFilled == other.lot5VacancyFilled &&
        gallery == other.gallery &&
        conveniencePark == other.conveniencePark &&
        convenienceFood == other.convenienceFood &&
        convenienceInternet == other.convenienceInternet &&
        convenienceSleep == other.convenienceSleep &&
        convenienceParking == other.convenienceParking &&
        conveniencePool == other.conveniencePool &&
        participants == other.participants;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), date.hashCode), adminId.hashCode), addressDistrict.hashCode), addressStreet.hashCode), addressCity.hashCode), addressState.hashCode), lot1Price.hashCode), lot1VacancyExistent.hashCode), lot1VacancyFilled.hashCode), lot2Price.hashCode),
                                                                                lot2VacancyExistent.hashCode),
                                                                            lot2VacancyFilled.hashCode),
                                                                        lot3Price.hashCode),
                                                                    lot3VacancyExistent.hashCode),
                                                                lot3VacancyFilled.hashCode),
                                                            lot4Price.hashCode),
                                                        lot4VacancyExistent.hashCode),
                                                    lot4VacancyFilled.hashCode),
                                                lot5Price.hashCode),
                                            lot5VacancyExistent.hashCode),
                                        lot5VacancyFilled.hashCode),
                                    gallery.hashCode),
                                conveniencePark.hashCode),
                            convenienceFood.hashCode),
                        convenienceInternet.hashCode),
                    convenienceSleep.hashCode),
                convenienceParking.hashCode),
            conveniencePool.hashCode),
        participants.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponsePlayday')
          ..add('id', id)
          ..add('date', date)
          ..add('adminId', adminId)
          ..add('addressDistrict', addressDistrict)
          ..add('addressStreet', addressStreet)
          ..add('addressCity', addressCity)
          ..add('addressState', addressState)
          ..add('lot1Price', lot1Price)
          ..add('lot1VacancyExistent', lot1VacancyExistent)
          ..add('lot1VacancyFilled', lot1VacancyFilled)
          ..add('lot2Price', lot2Price)
          ..add('lot2VacancyExistent', lot2VacancyExistent)
          ..add('lot2VacancyFilled', lot2VacancyFilled)
          ..add('lot3Price', lot3Price)
          ..add('lot3VacancyExistent', lot3VacancyExistent)
          ..add('lot3VacancyFilled', lot3VacancyFilled)
          ..add('lot4Price', lot4Price)
          ..add('lot4VacancyExistent', lot4VacancyExistent)
          ..add('lot4VacancyFilled', lot4VacancyFilled)
          ..add('lot5Price', lot5Price)
          ..add('lot5VacancyExistent', lot5VacancyExistent)
          ..add('lot5VacancyFilled', lot5VacancyFilled)
          ..add('gallery', gallery)
          ..add('conveniencePark', conveniencePark)
          ..add('convenienceFood', convenienceFood)
          ..add('convenienceInternet', convenienceInternet)
          ..add('convenienceSleep', convenienceSleep)
          ..add('convenienceParking', convenienceParking)
          ..add('conveniencePool', conveniencePool)
          ..add('participants', participants))
        .toString();
  }
}

class ResponsePlaydayBuilder
    implements Builder<ResponsePlayday, ResponsePlaydayBuilder> {
  _$ResponsePlayday? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _adminId;
  String? get adminId => _$this._adminId;
  set adminId(String? adminId) => _$this._adminId = adminId;

  String? _addressDistrict;
  String? get addressDistrict => _$this._addressDistrict;
  set addressDistrict(String? addressDistrict) =>
      _$this._addressDistrict = addressDistrict;

  String? _addressStreet;
  String? get addressStreet => _$this._addressStreet;
  set addressStreet(String? addressStreet) =>
      _$this._addressStreet = addressStreet;

  String? _addressCity;
  String? get addressCity => _$this._addressCity;
  set addressCity(String? addressCity) => _$this._addressCity = addressCity;

  String? _addressState;
  String? get addressState => _$this._addressState;
  set addressState(String? addressState) => _$this._addressState = addressState;

  int? _lot1Price;
  int? get lot1Price => _$this._lot1Price;
  set lot1Price(int? lot1Price) => _$this._lot1Price = lot1Price;

  int? _lot1VacancyExistent;
  int? get lot1VacancyExistent => _$this._lot1VacancyExistent;
  set lot1VacancyExistent(int? lot1VacancyExistent) =>
      _$this._lot1VacancyExistent = lot1VacancyExistent;

  int? _lot1VacancyFilled;
  int? get lot1VacancyFilled => _$this._lot1VacancyFilled;
  set lot1VacancyFilled(int? lot1VacancyFilled) =>
      _$this._lot1VacancyFilled = lot1VacancyFilled;

  int? _lot2Price;
  int? get lot2Price => _$this._lot2Price;
  set lot2Price(int? lot2Price) => _$this._lot2Price = lot2Price;

  int? _lot2VacancyExistent;
  int? get lot2VacancyExistent => _$this._lot2VacancyExistent;
  set lot2VacancyExistent(int? lot2VacancyExistent) =>
      _$this._lot2VacancyExistent = lot2VacancyExistent;

  int? _lot2VacancyFilled;
  int? get lot2VacancyFilled => _$this._lot2VacancyFilled;
  set lot2VacancyFilled(int? lot2VacancyFilled) =>
      _$this._lot2VacancyFilled = lot2VacancyFilled;

  int? _lot3Price;
  int? get lot3Price => _$this._lot3Price;
  set lot3Price(int? lot3Price) => _$this._lot3Price = lot3Price;

  int? _lot3VacancyExistent;
  int? get lot3VacancyExistent => _$this._lot3VacancyExistent;
  set lot3VacancyExistent(int? lot3VacancyExistent) =>
      _$this._lot3VacancyExistent = lot3VacancyExistent;

  int? _lot3VacancyFilled;
  int? get lot3VacancyFilled => _$this._lot3VacancyFilled;
  set lot3VacancyFilled(int? lot3VacancyFilled) =>
      _$this._lot3VacancyFilled = lot3VacancyFilled;

  int? _lot4Price;
  int? get lot4Price => _$this._lot4Price;
  set lot4Price(int? lot4Price) => _$this._lot4Price = lot4Price;

  int? _lot4VacancyExistent;
  int? get lot4VacancyExistent => _$this._lot4VacancyExistent;
  set lot4VacancyExistent(int? lot4VacancyExistent) =>
      _$this._lot4VacancyExistent = lot4VacancyExistent;

  int? _lot4VacancyFilled;
  int? get lot4VacancyFilled => _$this._lot4VacancyFilled;
  set lot4VacancyFilled(int? lot4VacancyFilled) =>
      _$this._lot4VacancyFilled = lot4VacancyFilled;

  int? _lot5Price;
  int? get lot5Price => _$this._lot5Price;
  set lot5Price(int? lot5Price) => _$this._lot5Price = lot5Price;

  int? _lot5VacancyExistent;
  int? get lot5VacancyExistent => _$this._lot5VacancyExistent;
  set lot5VacancyExistent(int? lot5VacancyExistent) =>
      _$this._lot5VacancyExistent = lot5VacancyExistent;

  int? _lot5VacancyFilled;
  int? get lot5VacancyFilled => _$this._lot5VacancyFilled;
  set lot5VacancyFilled(int? lot5VacancyFilled) =>
      _$this._lot5VacancyFilled = lot5VacancyFilled;

  ListBuilder<String>? _gallery;
  ListBuilder<String> get gallery =>
      _$this._gallery ??= new ListBuilder<String>();
  set gallery(ListBuilder<String>? gallery) => _$this._gallery = gallery;

  ListBuilder<String>? _conveniencePark;
  ListBuilder<String> get conveniencePark =>
      _$this._conveniencePark ??= new ListBuilder<String>();
  set conveniencePark(ListBuilder<String>? conveniencePark) =>
      _$this._conveniencePark = conveniencePark;

  ListBuilder<String>? _convenienceFood;
  ListBuilder<String> get convenienceFood =>
      _$this._convenienceFood ??= new ListBuilder<String>();
  set convenienceFood(ListBuilder<String>? convenienceFood) =>
      _$this._convenienceFood = convenienceFood;

  ListBuilder<String>? _convenienceInternet;
  ListBuilder<String> get convenienceInternet =>
      _$this._convenienceInternet ??= new ListBuilder<String>();
  set convenienceInternet(ListBuilder<String>? convenienceInternet) =>
      _$this._convenienceInternet = convenienceInternet;

  ListBuilder<String>? _convenienceSleep;
  ListBuilder<String> get convenienceSleep =>
      _$this._convenienceSleep ??= new ListBuilder<String>();
  set convenienceSleep(ListBuilder<String>? convenienceSleep) =>
      _$this._convenienceSleep = convenienceSleep;

  ListBuilder<String>? _convenienceParking;
  ListBuilder<String> get convenienceParking =>
      _$this._convenienceParking ??= new ListBuilder<String>();
  set convenienceParking(ListBuilder<String>? convenienceParking) =>
      _$this._convenienceParking = convenienceParking;

  ListBuilder<String>? _conveniencePool;
  ListBuilder<String> get conveniencePool =>
      _$this._conveniencePool ??= new ListBuilder<String>();
  set conveniencePool(ListBuilder<String>? conveniencePool) =>
      _$this._conveniencePool = conveniencePool;

  ListBuilder<ResponseParticipant>? _participants;
  ListBuilder<ResponseParticipant> get participants =>
      _$this._participants ??= new ListBuilder<ResponseParticipant>();
  set participants(ListBuilder<ResponseParticipant>? participants) =>
      _$this._participants = participants;

  ResponsePlaydayBuilder();

  ResponsePlaydayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _adminId = $v.adminId;
      _addressDistrict = $v.addressDistrict;
      _addressStreet = $v.addressStreet;
      _addressCity = $v.addressCity;
      _addressState = $v.addressState;
      _lot1Price = $v.lot1Price;
      _lot1VacancyExistent = $v.lot1VacancyExistent;
      _lot1VacancyFilled = $v.lot1VacancyFilled;
      _lot2Price = $v.lot2Price;
      _lot2VacancyExistent = $v.lot2VacancyExistent;
      _lot2VacancyFilled = $v.lot2VacancyFilled;
      _lot3Price = $v.lot3Price;
      _lot3VacancyExistent = $v.lot3VacancyExistent;
      _lot3VacancyFilled = $v.lot3VacancyFilled;
      _lot4Price = $v.lot4Price;
      _lot4VacancyExistent = $v.lot4VacancyExistent;
      _lot4VacancyFilled = $v.lot4VacancyFilled;
      _lot5Price = $v.lot5Price;
      _lot5VacancyExistent = $v.lot5VacancyExistent;
      _lot5VacancyFilled = $v.lot5VacancyFilled;
      _gallery = $v.gallery.toBuilder();
      _conveniencePark = $v.conveniencePark.toBuilder();
      _convenienceFood = $v.convenienceFood.toBuilder();
      _convenienceInternet = $v.convenienceInternet.toBuilder();
      _convenienceSleep = $v.convenienceSleep.toBuilder();
      _convenienceParking = $v.convenienceParking.toBuilder();
      _conveniencePool = $v.conveniencePool.toBuilder();
      _participants = $v.participants.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponsePlayday other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponsePlayday;
  }

  @override
  void update(void Function(ResponsePlaydayBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponsePlayday build() => _build();

  _$ResponsePlayday _build() {
    _$ResponsePlayday _$result;
    try {
      _$result = _$v ??
          new _$ResponsePlayday._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ResponsePlayday', 'id'),
              date: BuiltValueNullFieldError.checkNotNull(
                  date, r'ResponsePlayday', 'date'),
              adminId: BuiltValueNullFieldError.checkNotNull(
                  adminId, r'ResponsePlayday', 'adminId'),
              addressDistrict: BuiltValueNullFieldError.checkNotNull(
                  addressDistrict, r'ResponsePlayday', 'addressDistrict'),
              addressStreet: BuiltValueNullFieldError.checkNotNull(
                  addressStreet, r'ResponsePlayday', 'addressStreet'),
              addressCity: BuiltValueNullFieldError.checkNotNull(
                  addressCity, r'ResponsePlayday', 'addressCity'),
              addressState: BuiltValueNullFieldError.checkNotNull(
                  addressState, r'ResponsePlayday', 'addressState'),
              lot1Price: BuiltValueNullFieldError.checkNotNull(
                  lot1Price, r'ResponsePlayday', 'lot1Price'),
              lot1VacancyExistent:
                  BuiltValueNullFieldError.checkNotNull(lot1VacancyExistent, r'ResponsePlayday', 'lot1VacancyExistent'),
              lot1VacancyFilled: BuiltValueNullFieldError.checkNotNull(lot1VacancyFilled, r'ResponsePlayday', 'lot1VacancyFilled'),
              lot2Price: lot2Price,
              lot2VacancyExistent: lot2VacancyExistent,
              lot2VacancyFilled: lot2VacancyFilled,
              lot3Price: lot3Price,
              lot3VacancyExistent: lot3VacancyExistent,
              lot3VacancyFilled: lot3VacancyFilled,
              lot4Price: lot4Price,
              lot4VacancyExistent: lot4VacancyExistent,
              lot4VacancyFilled: lot4VacancyFilled,
              lot5Price: lot5Price,
              lot5VacancyExistent: lot5VacancyExistent,
              lot5VacancyFilled: lot5VacancyFilled,
              gallery: gallery.build(),
              conveniencePark: conveniencePark.build(),
              convenienceFood: convenienceFood.build(),
              convenienceInternet: convenienceInternet.build(),
              convenienceSleep: convenienceSleep.build(),
              convenienceParking: convenienceParking.build(),
              conveniencePool: conveniencePool.build(),
              participants: participants.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'gallery';
        gallery.build();
        _$failedField = 'conveniencePark';
        conveniencePark.build();
        _$failedField = 'convenienceFood';
        convenienceFood.build();
        _$failedField = 'convenienceInternet';
        convenienceInternet.build();
        _$failedField = 'convenienceSleep';
        convenienceSleep.build();
        _$failedField = 'convenienceParking';
        convenienceParking.build();
        _$failedField = 'conveniencePool';
        conveniencePool.build();
        _$failedField = 'participants';
        participants.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResponsePlayday', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
