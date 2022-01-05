import 'package:dartz/dartz.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/infra/datasources/evento_datasource.dart';
import 'package:eventos_ca/modules/evento_module/infra/models/evento_model.dart';
import 'package:eventos_ca/modules/evento_module/infra/repositories/evento_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'evento_repository_test.mocks.dart';

@GenerateMocks([EventoDatasource])
void main() {
  final datasource = MockEventoDatasource();
  final repository = EventoRepositoryImpl(datasource);
  test('Deve retornar uma lista de Evento', () async {
    when(datasource.getSearch(any)).thenAnswer((_) async => <EventoModel>[]);
    final result = await repository.search("Dummy");
    expect(result, isA<Right>());
  });

  test('Deve retornar um DatasourceError se o datasource falhar ', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    var result = await repository.search("");
    expect(result.fold(id, id), isA<DatasourceError>());
    result = await repository.search(null);
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
