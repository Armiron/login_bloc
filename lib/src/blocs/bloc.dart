import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

// bloc.emailController.sink.add() // Too hard to understand
// bloc.changeEmail() // Easier

class Bloc extends Object with Validators {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => CombineLatestStream.combine2(
      emailStream, passwordStream, (email, password) => true);

  dispose() {
    _email.close();
    _password.close();
  }
}

// final bloc = Bloc();
