import 'package:TraceMe/src/UI/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'blocs/LoginProvider.dart';

class App extends StatelessWidget {
  @override
  build(context) {
    return LoginProvider(
      child: MaterialApp(
        title: 'TraceMe',
        home: Scaffold(
            //appBar: AppBar(
            //  title: Text("TraceMe dashboard"),
            //),
            body: LoginScreen()),
      ),
    );
  }
}
