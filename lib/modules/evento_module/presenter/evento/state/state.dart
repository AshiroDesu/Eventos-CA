import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';

abstract class SearchState {}

class SuccessState implements SearchState {
  final List<Evento> list;

  const SuccessState(this.list);
}

class SearchStart implements SearchState {
  const SearchStart();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class SearchError implements SearchState {
  final FailureSearch error;

  const SearchError(this.error);
}
