class UserModel {
  final String? name;
  final String? email;
  final String? uid;
  final bool? isChef;
  final String? imageUrl;

  UserModel({
    this.name,
    this.email,
    this.uid,
    this.isChef,
    this.imageUrl,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'img_url': imageUrl,
      'is_chef': isChef,
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
      isChef: map['is_chef'],
      imageUrl: map['img_url'],
    );
  }

  static final empty = UserModel(
    name: '',
    email: '',
  );

// Override toString method for easy debugging
  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, uid: $uid, isChef: $isChef, imageUrl: $imageUrl}';
  }
}
