class AppException implements Exception {
  final message;
  final prefix;
  AppException([this.message, this.prefix]);
  String toString() {
    return "$message$prefix";
  }
}

////////////------------fetch exception ---------/////////
class FetchException extends AppException {
  FetchException([String, message])
    : super(message, "error during communication");
}

////////////------------bad exception ---------/////////
class BadException extends AppException {
  BadException([String, message]) : super(message, "invild request");
}

////////////------------unuthorized exception ---------/////////
class UnuthorizedException extends AppException {
  UnuthorizedException([String, message])
    : super(message, "Unuthorized request");
}

////////////------------unuthorized exception ---------/////////
class InvilidException extends AppException {
  InvilidException([String, message]) : super(message, "invild input");
}

class InternetConnection extends AppException {
  InternetConnection([String, message])
    : super(message, "No internet connection");
}

class TimeoutRequest extends AppException {
  TimeoutRequest([String, message]) : super(message, "Request time is out");
}
