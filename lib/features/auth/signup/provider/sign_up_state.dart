/*

  SIGN UP STATE

 */

class SignUpState {
  final String name;
  final String email;
  final String restaurantName;
  final String restaurantAddress;
  final String password;
  final String confirmPassword;

  SignUpState({
    this.name = '',
    this.email = '',
    this.restaurantName = '',
    this.restaurantAddress = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith({
    String? name,
    String? email,
    String? restaurantName,
    String? restaurantAddress,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantAddress: restaurantAddress ?? this.restaurantAddress,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
