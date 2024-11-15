class UserModel {
  // String userId;
  String name;
  String email;
  bool hasActiveOrder;

  UserModel({
    // required this.userId,
    required this.name,
    required this.email,
    required this.hasActiveOrder,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // 'id': userId.toString(),
      'email': email,
      'has_active_order': hasActiveOrder,
    };
  }

  /*
   Receive as a JSon format
  and convert to UserModel
 */
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      // userId: map['id'],
      name: map['name'],
      email: map['email'],
      hasActiveOrder: map['has_active_order'],
    );
  }

  static final empty = UserModel(
    // userId: '',
    name: '',
    email: '',
    hasActiveOrder: false,
  );

  // @override
  // String toString() {
  //   return 'UserModel : $userId, $email, $name, $hasActiveOrder';
  // }
}
