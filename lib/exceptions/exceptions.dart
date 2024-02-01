import 'package:bloc_boiler_plate/main.dart';
import 'package:flutter/material.dart';

class ServerException implements Exception {
  final String message;
  final int statusCode;
  ServerException(this.message, {this.statusCode = 500});
}

class NetworkException implements Exception {
  final String message;
  final int statusCode;
  NetworkException(this.message, {this.statusCode = 500});
}

class UnAuthorizedException implements Exception {
  final String message;
  final int statusCode;

  UnAuthorizedException(this.message, {this.statusCode = 401});
}

class BadRequestException implements Exception {
  final String message;
  final int statusCode;

  BadRequestException(this.message, {this.statusCode = 400});
}

class OtherException implements Exception {
  final String message;
  final int statusCode;

  OtherException(this.message, {this.statusCode = 500});
}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
    }
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}