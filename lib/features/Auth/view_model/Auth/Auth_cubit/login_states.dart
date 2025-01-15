class LoginStates {}

class LoginInitStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {}

class LoginErrorStates extends LoginStates {
  final String error;
  LoginErrorStates({required this.error});
}

class RegisterStates {}

class RegisterInitStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {}

class RegisterErrorStates extends RegisterStates {
  final String error;
  RegisterErrorStates({required this.error});
}

/////////////logoutstates/////////////////
class LogOutStates {}

class LogOutInitStates extends LogOutStates {}

class LogOutLoadingStates extends LogOutStates {}

class LogOutSuccessStates extends LogOutStates {}

class LogOutErrorStates extends LogOutStates {
  final String error;
  LogOutErrorStates({required this.error});
}
