import 'package:eventos_ca/modules/evento_module/domain/usecases/search_evento.dart';
import 'package:mobx/mobx.dart';
import 'package:async/async.dart';

import 'state/state.dart';

part 'evento_mobx.g.dart';

class EventoMobx = EventoMobxBase with _$EventoMobx;

abstract class EventoMobxBase with Store {
  final SearchEvento searchByText;
  CancelableOperation? cancellableOperation;

  EventoMobxBase(this.searchByText) {
    reaction((_) => searchText, (text) async {
      stateReaction(text.toString(), cancellableOperation);
    }, delay: 500);
  }
  Future stateReaction(String text, [cancellableOperation]) async {
    await cancellableOperation?.cancel();
    cancellableOperation =
        CancelableOperation<SearchState>.fromFuture(makeSearch(text));
    if (text.isEmpty) {
      setState(SearchStart());
      return;
    }

    setState(LoadingState());

    setState(await cancellableOperation.valueOrCancellation(LoadingState()));
  }

  Future<SearchState> makeSearch(String text) async {
    var result = await searchByText(text);
    return result.fold((l) => SearchError(l), (r) => SuccessState(r));
  }

  @observable
  String searchText = "";

  @observable
  SearchState state = SearchStart();

  @action
  setSearchText(String value) => searchText = value;

  @action
  setState(SearchState value) => state = value;
}
