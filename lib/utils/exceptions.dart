abstract class CustomExceptions implements Exception {
  String message;

  CustomExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}

//400
class BadRequestException extends CustomExceptions {
  BadRequestException(super.message);
}

//404
class NotFoundException extends CustomExceptions {
  NotFoundException(super.message);
}

//500
class ServerException extends CustomExceptions {
  ServerException(super.message);
}

class UnknownException extends CustomExceptions {
  UnknownException(super.message);
}