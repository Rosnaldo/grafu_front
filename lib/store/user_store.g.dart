// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserMobx on UserMobxBase, Store {
  Computed<User>? _$getUserComputed;

  @override
  User get getUser => (_$getUserComputed ??=
          Computed<User>(() => super.getUser, name: 'UserMobxBase.getUser'))
      .value;

  late final _$_userAtom = Atom(name: 'UserMobxBase._user', context: context);

  @override
  User get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(User value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$UserMobxBaseActionController =
      ActionController(name: 'UserMobxBase', context: context);

  @override
  dynamic setUser(User u) {
    final _$actionInfo = _$UserMobxBaseActionController.startAction(
        name: 'UserMobxBase.setUser');
    try {
      return super.setUser(u);
    } finally {
      _$UserMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getUser: ${getUser}
    ''';
  }
}
