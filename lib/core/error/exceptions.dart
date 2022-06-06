class DecodeJsonException implements Exception {}

class ParseToEntityException implements Exception {}

class MissingRequiredFieldException implements Exception {}

class DateException implements Exception {}

class ParseToModelException implements Exception {}

class ConnectionException implements Exception {}

class ServerException implements Exception {}

class NotFoundException extends ServerException {}

class BadRequestException extends ServerException {}

class WrongJsonStructureException extends ServerException {}

class UnauthorizedException extends ServerException {}

class ObsoleteVersionException extends ServerException {}

class TokenNotFoundException implements Exception {}

class LocalStorageException implements Exception {}

class UserIdNotFoundException implements Exception {}

class ConflictException implements Exception {}
