import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'evento_mobx.dart';
import 'state/state.dart';

class EventoPage extends StatefulWidget {
  const EventoPage({Key? key}) : super(key: key);

  @override
  _EventoPageState createState() => _EventoPageState();
}

class _EventoPageState extends ModularState<EventoPage, EventoMobx> {
  TextEditingController textSend = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Search'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
              child: TextField(
                onChanged: controller.setSearchText,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Search'),
              ),
            ),
            TextField(
              controller: textSend,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Send'),
            ),
            Expanded(
              child: Observer(builder: (_) {
                var state = controller.state;

                /* for(var item in) {
print(item);
}
*/

                if (state is SearchError) {
                  return Center(
                    child: Text('Digite alguma coisa...'),
                  );
                } else if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessState) {
                  return _buildList(state.list);
                } else {
                  return Container(
                    child: Text('Vazio'),
                  );
                }
              }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {},
        ));
  }

  Widget _buildList(List<Evento> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        return ListTile(
          title: Text(item.name),
        );
      },
    );
  }

  Widget _buildError(FailureSearch error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is SearchError) {
      return Center(
        child: Text('Erro na Api'),
      );
    } else {
      return Center(
        child: Text('Erro interno'),
      );
    }
  }
}
