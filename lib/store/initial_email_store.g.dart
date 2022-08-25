// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_email_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InitialEmailStore on InitialEmailStoreBase, Store {
  late final _$emailAtom =
      Atom(name: 'InitialEmailStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$InitialEmailStoreBaseActionController =
      ActionController(name: 'InitialEmailStoreBase', context: context);

  @override
  dynamic setEmail(String e) {
    final _$actionInfo = _$InitialEmailStoreBaseActionController.startAction(
        name: 'InitialEmailStoreBase.setEmail');
    try {
      return super.setEmail(e);
    } finally {
      _$InitialEmailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email}
    ''';
  }
}
