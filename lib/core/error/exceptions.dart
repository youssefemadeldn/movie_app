import 'package:movie_app/core/network/error_message_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerExceptions({required this.errorMessageModel});
}

class LocalDataBaseException implements Exception {
  final String message;

  LocalDataBaseException({required this.message});
}
