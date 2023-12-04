//log in exception
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//Register view exceptions

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

//generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}

class CantSentEmailAuthException implements Exception {}

class CouldNotFindFoodException
    implements Exception {} //TODO: Take it to where it belongs
