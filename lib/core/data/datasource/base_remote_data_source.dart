
import '../../error/exceptions.dart';

const HTTP_SUCCESS = 200;
const HTTP_USER_NOT_FOUND = 404;
const HTTP_FORBIDDEN = 403;

abstract class BaseRemoteDataSource {

  Map<String, String> getRequestHeader() {
    return {
      'accept': 'application/json',
    };
  }

  void checkResponseError(int statusCode) {
    switch (statusCode) {
      case 403:
        throw ForbiddenException();
      case 404:
        throw NotFoundException();
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 409:
        throw ConflictException();
      case 410:
        throw ObsoleteVersionException();
      default:
        throw ServerException();
    }
  }
}
