import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';
import 'package:eventos_ca/modules/evento_module/domain/errors/errors.dart';

abstract class CreateState {}

class CreateSuccessState implements CreateState {
  final bool worked;

  const CreateSuccessState(this.worked);
}

class CreateStart implements CreateState {
  const CreateStart();
}

class CreateLoadingState implements CreateState {
  const CreateLoadingState();
}

class CreateError implements CreateState {
  final FailurePost error;

  CreateError(this.error);

  
}
