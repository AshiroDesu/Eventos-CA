import 'package:dio/dio.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:eventos_ca/modules/evento_module/infra/datasources/evento_datasource.dart';
import 'package:eventos_ca/modules/evento_module/infra/models/evento_model.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class ApiDatasource implements EventoDatasource {
  final Dio dio;

  ApiDatasource(this.dio);
  @override
  Future<List<EventoModel>> getSearch(String? searchText) async {
    final response =
        await dio.get('https://webapi-event.herokuapp.com/v1/event');
    if (response.statusCode == 200) {
      final list =
          (response.data as List).map((e) => EventoModel.fromMap(e)).toList();
      return list;
    } else {
      throw DatasourceError(toString());
    }
  }

  @override
  Future<void> createSucess(EventoModel model) async {
    try {
      final response = await dio.post(
          'https://webapi-event.herokuapp.com/v1/event',
          data: {model.toMap()});

      return response.data;
    } on DioError catch (e) {
      throw DatasourceError(toString());
    }
  }

  @override
  Future<void> deleteSucess(String id) async {
    try {
      var response =
          await Dio().delete('https://webapi-event.herokuapp.com/v1/event/$id');
    } on DioError catch (e) {
      throw DatasourceError(toString());
    }
  }
}
