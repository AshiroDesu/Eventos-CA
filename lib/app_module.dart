import 'package:dio/dio.dart';
import 'package:eventos_ca/modules/evento_module/domain/usecases/search_evento.dart';
import 'package:eventos_ca/modules/evento_module/external/datasources/api/api_datasource.dart';
import 'package:eventos_ca/modules/evento_module/external/datasources/database/database_datasource.dart';
import 'package:eventos_ca/modules/evento_module/infra/repositories/evento_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import '';
import 'modules/evento_module/presenter/evento/evento_mobx.dart';
import 'modules/evento_module/presenter/evento/evento_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => EventoRepositoryImpl(i())),
        Bind((i) => ApiDatasource(i())),
        Bind((i) => Dio()),
        Bind((i) => SearchEventoImpl(i())),
        Bind((i) => EventoMobx(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        //view route
        ChildRoute('/', child: (_, __) => EventoPage()),
      ];

  @override
  Widget get view => AppWidget();
}
