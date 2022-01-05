import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/domain/repositories/evento_repository.dart';
import 'package:eventos_ca/modules/evento_module/infra/datasources/evento_datasource.dart';
import '../../external/datasources/database/database_datasource.dart';

class EventoRepositoryImpl implements EventoRepository {
  final EventoDatasource datasource;

  EventoRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureSearch, List<Evento>>> search(String? searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      final db = DatabaseDatasource();
      final verifier = await db.getSearch(searchText);
      if (verifier.isNotEmpty) {
        db.deleteAllEvento('');
      }
      for (var item in result) {
        db.createSucess(item);
      }

      return Right(result);
    } on DatasourceError catch (e) {
      final db = DatabaseDatasource();
      final result = await db.getSearch(searchText);
      return Right(result);
    } finally {
      return Left(DatasourceError(toString()));
    }
  }
}
