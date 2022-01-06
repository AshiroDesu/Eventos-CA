import 'package:eventos_ca/modules/evento_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        //view route
        ModuleRoute('/', module: EventoModule())
      ];

  @override
  Widget get view => AppWidget();
}
