import 'package:dio/dio.dart';
import 'package:eventos_ca/modules/evento_module/domain/usecases/search_evento.dart';
import 'package:eventos_ca/modules/evento_module/external/datasources/api/api_datasource.dart';
import 'package:eventos_ca/modules/evento_module/infra/repositories/evento_repository_impl.dart';
import 'package:eventos_ca/modules/evento_module/presenter/create_evento/create_evento_page_controller.dart';
import 'package:eventos_ca/modules/evento_module/presenter/create_evento/create_page.dart';
import 'package:eventos_ca/modules/evento_module/presenter/evento/search_evento_controller.dart';
import 'package:eventos_ca/modules/evento_module/presenter/evento/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => EventoRepositoryImpl(i())),
        Bind((i) => ApiDatasource(i())),
        Bind((i) => Dio()),
        Bind((i) => SearchEventoImpl(i())),
        Bind((i) => EventoListValueNotifier(i())),
        Bind((i) => CreateEventoValueNotifier())
      ];

  @override
  List<ModularRoute> get routes => [
        //view route
        ChildRoute('/', child: (_, __) => EventoPage()),
        ChildRoute('/create', child: (_, __) => CreatePage()),
      ];
}
