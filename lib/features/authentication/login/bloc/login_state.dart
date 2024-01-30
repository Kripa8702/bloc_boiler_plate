part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.emailController,
    this.passwordController,
    this.status = LoginStatus.initial,
  });
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final LoginStatus status;

  LoginState copyWith({
    UserModel? user,
    LoginStatus? status,
  }) {
    return LoginState(
      emailController: emailController ?? emailController,
      passwordController: passwordController ?? passwordController,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [emailController, passwordController, status];
}
