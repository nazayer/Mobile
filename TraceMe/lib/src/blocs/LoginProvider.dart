import 'package:TraceMe/src/blocs/LoginBloc.dart';
import 'package:flutter/material.dart';
import 'LoginBloc.dart';

class LoginProvider extends InheritedWidget {
  final loginbloc = LoginBloc(); // something wrong here
  LoginProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(LoginProvider)
            as LoginProvider)
        .loginbloc;
  }
}
