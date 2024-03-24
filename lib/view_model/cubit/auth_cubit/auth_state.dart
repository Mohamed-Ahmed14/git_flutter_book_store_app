abstract class AuthState{}

class InitState extends AuthState{}

class ChangeObscureSuccessState extends AuthState{}


class LoadingRegisterState extends AuthState{}

class SuccessRegisterState extends AuthState{}

class ErrorRegisterState extends AuthState{}


class LoadingLoginState extends AuthState{}

class SuccessLoginState extends AuthState{}

class ErrorLoginState extends AuthState{}