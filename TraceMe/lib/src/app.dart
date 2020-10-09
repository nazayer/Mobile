import 'package:TraceMe/src/screens/LoginScreen.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        MaterialApp,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TraceMe',
      home: Scaffold(
          //appBar: AppBar(
          //  title: Text("TraceMe dashboard"),
          //),
          body: LoginScreen()),
    );
  }
}
