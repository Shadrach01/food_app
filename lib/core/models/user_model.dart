class UserModel {
  final String? name;
  final String? email;
  final String? uid;
  final String? profilePic;

  UserModel({
    this.name,
    this.email,
    this.uid,
    this.profilePic,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profile_pic': profilePic,
    };
  }

  /*
   Receive as a JSon format
  and convert to UserModel
 */
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      profilePic: map['profile_pic'],
    );
  }

  static final empty = UserModel(
    name: '',
    email: '',
  );

// Override toString method for easy debugging
  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, uid: $uid, profilePic: $profilePic}';
  }
}
