abstract class AuthEvents {}

class LoginEvent extends AuthEvents {}

class RegisterEvent extends AuthEvents {}

class ForgetPasswordEvent extends AuthEvents {}

class CheckCurrentUserEvent extends AuthEvents {}

class LogOutEvent extends AuthEvents {}
