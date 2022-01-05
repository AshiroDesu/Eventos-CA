import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eventos_ca/app_module.dart';
import 'package:eventos_ca/modules/evento_module/domain/usecases/search_evento.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'modules/evento_module/external/datasources/api_datasource_test.mocks.dart';
import 'utils/api_response.dart';

void main() {
  var options = RequestOptions(
    path: '_',
  );
  final dio = MockDio();
  initModule(AppModule());
  test('Deve recuperar o Usecase sem erro', () {
    final usecase = Modular.get<SearchEvento>();
    expect(usecase, isA<SearchEventoImpl>());
  });

  test('Deve trazer uma lista de Evento', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(apiResult), statusCode: 200, requestOptions: options));

    final usecase = Modular.get<SearchEvento>();
    final result = await usecase('dummy');

    expect(result, isA<Right>());
  });
}
