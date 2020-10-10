import 'dart:async';
import 'package:TraceMe/src/mixins/ValidationMixin.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with ValidationMixin {
  //final _emailController = StreamController<String>.broadcast();
  //final _passwordController = StreamController<String>.broadcast();

  // behavoiur subjects can hold the last item which was passed into a stream while streamcontrollers do not
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //add data to stream, this is a function that accepts a string
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // retrieve data from stream. this is a function that returns a stream of type string
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  submit() {
    // extraing data from behaviour subjects then we can post it to server here

    final validEmail = _emailController.value;
    final validpassword = _passwordController.value;
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
