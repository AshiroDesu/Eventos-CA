import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventos_ca/app_module.dart';
import 'package:eventos_ca/modules/evento_module/presenter/evento/evento_mobx.dart';
import 'package:eventos_ca/modules/evento_module/presenter/evento/state/state.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import '../../utils/api_response.dart';
import '../evento_module/external/datasources/api_datasource_test.mocks.dart';

main() {
  var dio = MockDio();
  var options = RequestOptions(
    path: '_',
  );

  initModule(AppModule());

  when(dio.get(any)).thenAnswer((_) async => Response(
      data: jsonDecode(apiResult), statusCode: 200, requestOptions: options));

  test('deve retorna um SuccessState', () async {
    var store = Modular.get<EventoMobx>();
    var result = await store.makeSearch("text");
    expect(result, isA<SuccessState>());
  });

  test('deve trocar o estado para SuccessState', () async {
    var store = Modular.get<EventoMobx>();
    await store.stateReaction("text");
    expect(store.state, isA<SuccessState>());
  });
}
