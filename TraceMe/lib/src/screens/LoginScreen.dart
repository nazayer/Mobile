import 'package:TraceMe/src/mixins/ValidationMixin.dart';
import 'package:flutter/material.dart';
import '../blocs/LoginBloc_bloc.dart';

final loginBloc = new LoginBloc();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      onChanged: loginBloc.changeEmail,
      decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'you@example.com',
          errorText: 'Invalid password'),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField() {
    return TextField(
      onChanged: null,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        errorText: 'Invalid password',
      ),
      obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Login'),
      onPressed: () {},
      color: Colors.amber,
    );
  }
}

// class _LoginScreen extends StatefulWidget {
//   _LoginScreen({Key key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<_LoginScreen> with ValidationMixin {
//   final formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.all(20.0),
//         child: Form(
//           key: formKey,
//           child: Column(children: [
//             Container(margin: EdgeInsets.only(top: 25.0)),
//             emailField(),
//             passwordfield(),
//             Container(margin: EdgeInsets.only(top: 25.0)),
//             submitButton(),
//           ]),
//         ));
//   }

//   Widget emailField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Email Address',
//         hintText: 'you@example.com',
//       ),
//       keyboardType: TextInputType.emailAddress,
//       validator: validateEmail,
//       onSaved: (value) {
//         email = value;
//       },
//     );
//   }

//   Widget passwordfield() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Password',
//         hintText: 'Enter your password',
//       ),
//       obscureText: true,
//       validator: validatePassword,
//       onSaved: (value) {
//         password = value;
//       },
//     );
//   }

//   Widget submitButton() {
//     return RaisedButton(
//       child: Text('Submit'),
//       onPressed: () {
//         if (formKey.currentState
//             .validate()) //Call validator function on each textForm
//         {
//           formKey.currentState.save();
//           //TODO send email and password to server
//         }
//       },
//       color: Colors.amber,
//     );
//   }
// }
