part of 'learn_cubit.dart';

@immutable
abstract class LearnState {}

class LearnInitial extends LearnState {}

class LearnChangeSelect extends LearnState {}

class RegisterLoadingState extends LearnState{}

class RegisterSuccessState extends LearnState{}

class FailedToRegisterState extends LearnState{
  final String message;
  FailedToRegisterState({required this.message});
}



class LoginLoadingState extends LearnState{}
class LoginSuccessState extends LearnState{
  final String message;
  LoginSuccessState({required this.message});
}
class FailedToLoginState extends LearnState{
  final String message;
  FailedToLoginState({required this.message});
}


class FailedToResetPasswordState extends LearnState{
  final String message;
  FailedToResetPasswordState({required this.message});
}
