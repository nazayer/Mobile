import 'dart:async';
import 'dart:developer' as developer;
import 'package:TraceMe/src/mixins/ValidationMixin.dart';

class LoginBloc with ValidationMixin {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //add data to stream, this is a function that accepts a string
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // retrieve data from stream thsi is a function that returns a stream of type string
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
}
