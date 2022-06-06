abstract class Failure {}

class MissingRequiredFieldFailure extends Failure {}

class NotExpectedFailure extends Failure {}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

class TokenNotFoundFailure extends Failure {}

class LocalStorageFailure extends Failure {}

class UserIdNotFoundFailure extends Failure {}

class NotFoundFailure extends Failure {}

class UserNotFoundFailure extends Failure {}

class DecodeJsonFailure implements Failure {}

class ConflictFailure extends Failure {}

