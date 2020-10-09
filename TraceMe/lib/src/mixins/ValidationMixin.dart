import 'dart:async';

class ValidationMixin {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) => {
            if (email.contains('@'))
              {sink.add(email)}
            else
              {sink.addError("Please enter a valid email address!")}
          });

  final validatePassword = new StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) => {
            if (password.length > 6)
              {sink.add(password)}
            else
              {sink.addError('Please enter a valid password')}
          });
}
