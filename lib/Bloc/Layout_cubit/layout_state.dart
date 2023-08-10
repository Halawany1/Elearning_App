part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class ChangeSelectScreenState extends LayoutState{}

class GetUserDataSuccessState extends LayoutState {}

class GetUserDataLoadingState extends LayoutState {}


class ResetPasswordLoadingState extends LayoutState {}

class ResetPasswordSuccessState extends LayoutState {
  final String message;
  ResetPasswordSuccessState({required this.message});
}
class ChangenavState extends LayoutState {}


class FailedToResetPasswordState extends LayoutState{
  final String message;
  FailedToResetPasswordState({required this.message});
}
class FailedToGetUserDataState extends LayoutState{
  final String message;
  FailedToGetUserDataState({required this.message});
}
class FaildResetPasswordDataState extends LayoutState{
  final String message;
  FaildResetPasswordDataState({required this.message});
}