import 'package:dartz/dartz.dart';

import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/domain/repositories/evento_repository.dart';

abstract class CreateEvento {
  Future<Either<FailurePost, void>> post(Evento model);
}

class CreateEventoImpl implements CreateEvento {
  final EventoRepository repository;

  CreateEventoImpl(this.repository);
  @override
  Future<Either<FailurePost, void>> post(Evento model) async {
    if (model == null) {
      return Left(PostError(toString()));
    } else {
      return repository.create(model);
    }
  }
}
