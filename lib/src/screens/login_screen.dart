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
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (context) {},
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email Address',
        errorText: 'Invalid Email',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      // obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        labelText: "Password",
        errorText: 'Invalid Password',
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Submit"),
    );
  }
}
