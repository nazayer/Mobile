import 'package:TraceMe/src/UI/screens/login_screen.dart';
import 'package:TraceMe/src/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'blocs/LoginProvider.dart';

class App extends StatelessWidget {
  @override
  build(context) {
    return LoginProvider(
      child: MaterialApp(
        title: 'TraceMe',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/main': (context) => HomeScreen(),
          '/register': (context) => LoginScreen(),
          '/forgotPassword': (context) => LoginScreen(),
          '/notifications': (context) => LoginScreen(),
          '/profile': (context) => LoginScreen()
        },
      ),
    );
  }
}
