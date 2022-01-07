import 'package:eventos_ca/modules/evento_module/domain/usecases/search_evento.dart';
import 'package:eventos_ca/modules/evento_module/presenter/evento/state/state.dart';
import 'package:flutter/material.dart';

class EventoListValueNotifier {
final SearchEvento searchByText;

 EventoListValueNotifier(this.searchByText)

  Future<SearchState> makeSearch(String? text) async {
    
      var result = await searchByText(setSearchText(text));
    return result.fold((l) => SearchError(l), (r) => SuccessState(r));
   
}
  

  String? searchText = "";


  var state = ValueNotifier<SearchState>(SearchStart());

  setSearchText(String? value) => searchText = value;
  setState(SearchState value) => state.value = value;
}