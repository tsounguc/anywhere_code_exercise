abstract class Failure {
  final String? message;

  const Failure({this.message});
}

class FetchCharactersFailure extends Failure {
  const FetchCharactersFailure({String? message}) : super(message: message);
}
