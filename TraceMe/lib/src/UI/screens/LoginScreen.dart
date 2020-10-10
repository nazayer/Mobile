import 'package:TraceMe/src/blocs/LoginBloc.dart';
import 'package:flutter/material.dart';
import '../../blocs/LoginProvider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginProvider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          //Add header and logo here
          Container(margin: EdgeInsets.only(top: 25.0)),
          emailField(loginBloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          passwordField(loginBloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(loginBloc),
        ],
      ),
    );
  }

  Widget emailField(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: loginBloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(LoginBloc loginBloc) {
    return StreamBuilder(
        stream: loginBloc.passwordStream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: loginBloc.changePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              errorText: snapshot.error,
            ),
            obscureText: true,
          );
        });
  }

  Widget submitButton(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          onPressed: snapshot.hasData ? loginBloc.submit : null,
          color: Colors.amber,
        );
      },
    );
  }
}
