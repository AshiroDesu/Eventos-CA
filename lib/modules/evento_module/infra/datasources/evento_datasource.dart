import 'package:eventos_ca/modules/evento_module/infra/models/evento_model.dart';

abstract class EventoDatasource {
  Future<List<EventoModel>> getSearch(String? searchText);
  Future<void> createSucess(EventoModel model);
  Future<void> deleteSucess(String id);
}
