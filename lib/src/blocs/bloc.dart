import 'dart:async';
import 'validators.dart';

// bloc.emailController.sink.add() // Too hard to understand
// bloc.changeEmail() // Easier

class Bloc with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);

  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();
