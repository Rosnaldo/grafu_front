// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_participant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyParticipantMobx on MyParticipantMobxBase, Store {
  Computed<Participant>? _$getMyParticipantComputed;

  @override
  Participant get getMyParticipant => (_$getMyParticipantComputed ??=
          Computed<Participant>(() => super.getMyParticipant,
              name: 'MyParticipantMobxBase.getMyParticipant'))
      .value;

  late final _$_participantAtom =
      Atom(name: 'MyParticipantMobxBase._participant', context: context);

  @override
  Participant get _participant {
    _$_participantAtom.reportRead();
    return super._participant;
  }

  @override
  set _participant(Participant value) {
    _$_participantAtom.reportWrite(value, super._participant, () {
      super._participant = value;
    });
  }

  late final _$MyParticipantMobxBaseActionController =
      ActionController(name: 'MyParticipantMobxBase', context: context);

  @override
  dynamic setMyParticipant(Participant p) {
    final _$actionInfo = _$MyParticipantMobxBaseActionController.startAction(
        name: 'MyParticipantMobxBase.setMyParticipant');
    try {
      return super.setMyParticipant(p);
    } finally {
      _$MyParticipantMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getMyParticipant: ${getMyParticipant}
    ''';
  }
}
