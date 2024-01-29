part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.user,
    this.status = LoginStatus.initial,
  });
  final UserModel? user;
  final LoginStatus status;

  LoginState copyWith({
    UserModel? user,
    LoginStatus? status,
  }) {
    return LoginState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [user, status];
}
