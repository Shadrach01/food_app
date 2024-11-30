/*

  SIGN UP STATE

 */

class SignUpState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith(
      {String? name,
      String? email,
      String? password,
      String? confirmPassword}) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
