part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.user,
    this.message
  });
  final LoginStatus status;
  final UserModel? user;
  final String? message;

  LoginState copyWith({
    UserModel? user,
    LoginStatus? status,
    String? message
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message ?? this.message
    );
  }

  @override
  List<Object?> get props => [status, user, message];
}
