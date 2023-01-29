import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

// bloc.emailController.sink.add() // Too hard to understand
// bloc.changeEmail() // Easier

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => CombineLatestStream.combine2(
      emailStream, passwordStream, (email, password) => true);

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

// final bloc = Bloc();
