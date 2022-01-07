import 'package:eventos_ca/modules/evento_module/presenter/create_evento/create_evento_page_controller.dart';
import 'package:eventos_ca/modules/evento_module/presenter/create_evento/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState
    extends ModularState<CreatePage, CreateEventoValueNotifier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Create'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
            child: TextField(
              controller: controller.textSend,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Create new'),
            ),
          ),
          AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              if (controller.state.value is CreateError) {
                return Center(
                  child: Text('Erro'),
                );
              } else if (controller.state.value is CreateSuccessState) {
                return Text("Criado com sucesso");
              } else {
                return Container(
                  child: Text('alo'),
                );
              }
            },
          ),
          ElevatedButton(
              onPressed: () => controller.makePost(controller.textSend.text),
              child: Text("Send"))
        ],
      ),
    );
  }
}
