import 'package:dartz/dartz.dart';
import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/domain/repositories/evento_repository.dart';
import 'package:eventos_ca/modules/evento_module/domain/usecases/search_evento.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_evento_test.mocks.dart';

@GenerateMocks([EventoRepository])
void main() {
  final repository = MockEventoRepository();
  final usecase = SearchEventoImpl(repository);

  test('Deve retornar uma lista de Evento', () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<Evento>[]));
    final result = await usecase("Dummy");
    expect(result, isA<Right>());
  });

  test('Deve retornar uma exception caso texto seja inválido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<Evento>[]));
    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
