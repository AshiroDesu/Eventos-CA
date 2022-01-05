// Mocks generated by Mockito 5.0.17 from annotations
// in eventos_ca/test/modules/evento_module/infra/repositories/evento_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:eventos_ca/modules/evento_module/infra/datasources/evento_datasource.dart'
    as _i2;
import 'package:eventos_ca/modules/evento_module/infra/models/evento_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [EventoDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventoDatasource extends _i1.Mock implements _i2.EventoDatasource {
  MockEventoDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.EventoModel>> getSearch(String? searchText) =>
      (super.noSuchMethod(Invocation.method(#getSearch, [searchText]),
              returnValue:
                  Future<List<_i4.EventoModel>>.value(<_i4.EventoModel>[]))
          as _i3.Future<List<_i4.EventoModel>>);
}