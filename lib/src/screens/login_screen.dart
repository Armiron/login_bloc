import 'dart:async';

import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(children: [
        emailField(),
        passwordField(),
        Container(
          margin: EdgeInsets.only(top: 25),
        ),
        submitButton(),
      ]),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          // onChanged: (newValue) {
          //   bloc.changeEmail(newValue);
          // },
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          // obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: "Password",
            labelText: "Password",
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Submit"),
    );
  }
}
