// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseUser> _$responseUserSerializer =
    new _$ResponseUserSerializer();

class _$ResponseUserSerializer implements StructuredSerializer<ResponseUser> {
  @override
  final Iterable<Type> types = const [ResponseUser, _$ResponseUser];
  @override
  final String wireName = 'ResponseUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResponseUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.profession;
    if (value != null) {
      result
        ..add('profession')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ResponseUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseUserBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'profession':
          result.profession = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseUser extends ResponseUser {
  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? avatar;
  @override
  final int? age;
  @override
  final String? profession;

  factory _$ResponseUser([void Function(ResponseUserBuilder)? updates]) =>
      (new ResponseUserBuilder()..update(updates))._build();

  _$ResponseUser._(
      {required this.id,
      required this.name,
      required this.email,
      this.avatar,
      this.age,
      this.profession})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ResponseUser', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'ResponseUser', 'name');
    BuiltValueNullFieldError.checkNotNull(email, r'ResponseUser', 'email');
  }

  @override
  ResponseUser rebuild(void Function(ResponseUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseUserBuilder toBuilder() => new ResponseUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseUser &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        avatar == other.avatar &&
        age == other.age &&
        profession == other.profession;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), email.hashCode),
                avatar.hashCode),
            age.hashCode),
        profession.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseUser')
          ..add('id', id)
          ..add('name', name)
          ..add('email', email)
          ..add('avatar', avatar)
          ..add('age', age)
          ..add('profession', profession))
        .toString();
  }
}

class ResponseUserBuilder
    implements Builder<ResponseUser, ResponseUserBuilder> {
  _$ResponseUser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _profession;
  String? get profession => _$this._profession;
  set profession(String? profession) => _$this._profession = profession;

  ResponseUserBuilder();

  ResponseUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _email = $v.email;
      _avatar = $v.avatar;
      _age = $v.age;
      _profession = $v.profession;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseUser;
  }

  @override
  void update(void Function(ResponseUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseUser build() => _build();

  _$ResponseUser _build() {
    final _$result = _$v ??
        new _$ResponseUser._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ResponseUser', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ResponseUser', 'name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'ResponseUser', 'email'),
            avatar: avatar,
            age: age,
            profession: profession);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
