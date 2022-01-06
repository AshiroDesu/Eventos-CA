abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

abstract class FailurePost implements Exception {}

abstract class FailureDelete implements Exception {}

class EmptyList extends FailureSearch {}

class DatasourceError implements FailureSearch {
  final String message;
  DatasourceError(this.message);
}

class PostError implements FailurePost {
  final String message;
  PostError(this.message);
}
