import 'package:dartz/dartz.dart';
import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/domain/repositories/evento_repository.dart';

abstract class SearchEvento {
  Future<Either<FailureSearch, List<Evento>>> call(String searchText);
}

class SearchEventoImpl implements SearchEvento {
  final EventoRepository repository;

  SearchEventoImpl(this.repository);
  @override
  Future<Either<FailureSearch, List<Evento>>> call(String? searchText) async {
    if (searchText == null || searchText == "") {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
