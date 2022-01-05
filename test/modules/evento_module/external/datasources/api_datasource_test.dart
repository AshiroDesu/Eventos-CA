import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/external/datasources/api/api_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../utils/api_response.dart';
import 'api_datasource_test.mocks.dart';

@GenerateMocks([Dio])
Future<void> main() async {
  final dio = MockDio();
  var options = RequestOptions(
    path: '_',
  );

  final datasource = ApiDatasource(dio);
  test('Deve retornar uma lista de EventoModel', () {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(apiResult), statusCode: 200, requestOptions: options));

    final future = datasource.getSearch("searchText");
    expect(future, completes);
  });

  test('Deve retornar um DatasourceError se o código não for 200', () {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: null, statusCode: 400, requestOptions: options));

    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DatasourceError>()));
  });
  test('Deve retornar uma Exception', () {
    when(dio.get(any)).thenThrow(Exception());

    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<Exception>()));
  });
}
