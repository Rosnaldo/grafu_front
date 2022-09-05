// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_invited_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsInvitedMobx on IsInvitedMobxBase, Store {
  Computed<bool>? _$getIsInvitedComputed;

  @override
  bool get getIsInvited =>
      (_$getIsInvitedComputed ??= Computed<bool>(() => super.getIsInvited,
              name: 'IsInvitedMobxBase.getIsInvited'))
          .value;

  late final _$_isInvitedAtom =
      Atom(name: 'IsInvitedMobxBase._isInvited', context: context);

  @override
  bool get _isInvited {
    _$_isInvitedAtom.reportRead();
    return super._isInvited;
  }

  @override
  set _isInvited(bool value) {
    _$_isInvitedAtom.reportWrite(value, super._isInvited, () {
      super._isInvited = value;
    });
  }

  late final _$IsInvitedMobxBaseActionController =
      ActionController(name: 'IsInvitedMobxBase', context: context);

  @override
  dynamic setIsInvited(bool i) {
    final _$actionInfo = _$IsInvitedMobxBaseActionController.startAction(
        name: 'IsInvitedMobxBase.setIsInvited');
    try {
      return super.setIsInvited(i);
    } finally {
      _$IsInvitedMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getIsInvited: ${getIsInvited}
    ''';
  }
}
