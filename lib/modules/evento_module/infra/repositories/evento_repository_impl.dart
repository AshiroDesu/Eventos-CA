import 'package:dartz/dartz.dart';
import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/domain/repositories/evento_repository.dart';
import 'package:eventos_ca/modules/evento_module/infra/datasources/evento_datasource.dart';
import 'package:eventos_ca/modules/evento_module/infra/models/evento_model.dart';
import 'package:flutter/foundation.dart';
import '../../external/datasources/database/database_datasource.dart';

class EventoRepositoryImpl implements EventoRepository {
  final EventoDatasource datasource;
  EventoRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureSearch, List<Evento>>> search(String? searchText) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
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
    } else {
      try {
        final result = await datasource.getSearch(searchText);

        return Right(result);
      } on DatasourceError catch (e) {
        return Left(DatasourceError(toString()));
      }
    }
  }

  @override
  Future<Either<FailurePost, void>> create(Evento model) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      try {
        final result = await datasource.createSucess(model as EventoModel);
        final db = DatabaseDatasource();
        db.createSucess(model as EventoModel);
        return Right(result);
      } on PostError catch (e) {
        final db = DatabaseDatasource();
        final result = await db.createSucess(model as EventoModel);
        return Right(result);
      } finally {
        return Left(PostError(toString()));
      }
    } else {
      try {
        final result = await datasource.createSucess(model as EventoModel);
        return Right(result);
      } catch (e) {
        return Left(PostError(toString()));
      }
    }
  }

  @override
  Future<Either<FailureDelete, void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
