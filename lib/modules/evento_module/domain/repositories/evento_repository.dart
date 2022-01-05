import 'package:dartz/dartz.dart';
import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';

abstract class EventoRepository {
  Future<Either<FailureSearch, List<Evento>>> search(String? searchText);
}
