import 'package:eventos_ca/modules/evento_module/domain/usecases/create_evento.dart';
import 'package:eventos_ca/modules/evento_module/infra/models/evento_model.dart';
import 'package:eventos_ca/modules/evento_module/presenter/create_evento/state/state.dart';
import 'package:flutter/material.dart';

class CreateEventoValueNotifier {
  late final CreateEvento createByText;
  TextEditingController textSend = TextEditingController();

  Future<CreateState> makePost(String text) async {
    if (text != '') {
      var result = await createByText.post(setCreateText(text));
      return result.fold(
          (l) => CreateError(l), (r) => const CreateSuccessState(true));
    } else {
      return setState(CreateStart());
    }
  }

  var state = ValueNotifier<CreateState>(CreateStart());

  late EventoModel createPost;

  setCreateText(String value) =>
      createPost = EventoModel(id: '', name: value, amount: 0);
  setState(CreateState value) => state.value = value;
}
