// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$statusDadosAtom =
      Atom(name: 'HomeControllerBase.statusDados', context: context);

  @override
  Status get statusDados {
    _$statusDadosAtom.reportRead();
    return super.statusDados;
  }

  @override
  set statusDados(Status value) {
    _$statusDadosAtom.reportWrite(value, super.statusDados, () {
      super.statusDados = value;
    });
  }

  @override
  String toString() {
    return '''
statusDados: ${statusDados}
    ''';
  }
}
