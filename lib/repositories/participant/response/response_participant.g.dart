// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_participant.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseParticipant> _$responseParticipantSerializer =
    new _$ResponseParticipantSerializer();

class _$ResponseParticipantSerializer
    implements StructuredSerializer<ResponseParticipant> {
  @override
  final Iterable<Type> types = const [
    ResponseParticipant,
    _$ResponseParticipant
  ];
  @override
  final String wireName = 'ResponseParticipant';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResponseParticipant object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(ResponseUser)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ResponseParticipant deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseParticipantBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(ResponseUser))! as ResponseUser);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseParticipant extends ResponseParticipant {
  @override
  final String id;
  @override
  final ResponseUser user;
  @override
  final String status;

  factory _$ResponseParticipant(
          [void Function(ResponseParticipantBuilder)? updates]) =>
      (new ResponseParticipantBuilder()..update(updates))._build();

  _$ResponseParticipant._(
      {required this.id, required this.user, required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ResponseParticipant', 'id');
    BuiltValueNullFieldError.checkNotNull(user, r'ResponseParticipant', 'user');
    BuiltValueNullFieldError.checkNotNull(
        status, r'ResponseParticipant', 'status');
  }

  @override
  ResponseParticipant rebuild(
          void Function(ResponseParticipantBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseParticipantBuilder toBuilder() =>
      new ResponseParticipantBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseParticipant &&
        id == other.id &&
        user == other.user &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), user.hashCode), status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseParticipant')
          ..add('id', id)
          ..add('user', user)
          ..add('status', status))
        .toString();
  }
}

class ResponseParticipantBuilder
    implements Builder<ResponseParticipant, ResponseParticipantBuilder> {
  _$ResponseParticipant? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ResponseUserBuilder? _user;
  ResponseUserBuilder get user => _$this._user ??= new ResponseUserBuilder();
  set user(ResponseUserBuilder? user) => _$this._user = user;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ResponseParticipantBuilder();

  ResponseParticipantBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user = $v.user.toBuilder();
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseParticipant other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseParticipant;
  }

  @override
  void update(void Function(ResponseParticipantBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseParticipant build() => _build();

  _$ResponseParticipant _build() {
    _$ResponseParticipant _$result;
    try {
      _$result = _$v ??
          new _$ResponseParticipant._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ResponseParticipant', 'id'),
              user: user.build(),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'ResponseParticipant', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResponseParticipant', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
