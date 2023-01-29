import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({
    required Key key,
    required Widget child,
  }) : super(key: key, child: child);

  final bloc = Bloc();

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true; //TODO
  }
}
