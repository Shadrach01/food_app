/*

  LOG IN STATE

 */

class LogInState {
  final String email;
  final String password;

  const LogInState({
    this.email = '',
    this.password = '',
  });

  // To add info the the already available info
  LogInState copyWith({String? email, String? password}) {
    return LogInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
