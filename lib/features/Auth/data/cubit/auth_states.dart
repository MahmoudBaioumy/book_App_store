class AuthStates {}

class LoginInitStates extends AuthStates {}

class LoginLoadingStates extends AuthStates {}

class LoginSuccessStates extends AuthStates {}

class LoginErrorStates extends AuthStates {
  final String error;
  LoginErrorStates({required this.error});
}

/////////rifister///////////////////
class RegisterInitStates extends AuthStates {}

class RegisterLoadingStates extends AuthStates {}

class RegisterSuccessStates extends AuthStates {}

class RegisterErrorStates extends AuthStates {
  final String error;
  RegisterErrorStates({required this.error});
}

/////////////logoutstates/////////////////


class LogOutInitStates extends AuthStates {}

class LogOutLoadingStates extends AuthStates {}

class LogOutSuccessStates extends AuthStates {}

class LogOutErrorStates extends AuthStates {
  final String error;
  LogOutErrorStates({required this.error});
}
