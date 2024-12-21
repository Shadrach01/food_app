class ChefModel {
  final String? name;
  final String? email;
  final String? uid;
  final String? restaurantName;
  final String? restaurantAddress;
  final String? restaurantImage;
  final String? profilePic;

  ChefModel({
    this.name,
    this.email,
    this.uid,
    this.restaurantName,
    this.profilePic,
    this.restaurantAddress,
    this.restaurantImage,
  });

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profile_pic': profilePic,
      'restaurant_name': restaurantName,
      'restaurant_address': restaurantAddress,
      'restaurant_image': restaurantImage,
    };
  }

  /*
   Receive as a JSon format
  and convert to UserModel
 */
  factory ChefModel.fromMap(Map<String, dynamic> map) {
    return ChefModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      profilePic: map['profile_pic'],
      restaurantName: map['restaurant_name'],
      restaurantAddress: map['restaurant_address'],
      restaurantImage: map['restaurant_image'],
    );
  }

  static final empty = ChefModel(
    name: '',
    email: '',
  );

// Override toString method for easy debugging
  @override
  String toString() {
    return 'ChefModel{name: $name, email: $email,'
        ' uid: $uid, restaurantName: $restaurantName, '
        'restaurantLocation: $restaurantAddress,'
        ' proflePic: $profilePic, restaurantImage = $restaurantImage,}';
  }
}
