class SelectedFood {
  final String? title;
  final String? restaurant;
  final String? image;
  final String? price;

  SelectedFood({
    this.title,
    this.restaurant,
    this.image,
    this.price,
  });

  SelectedFood copyWith(
    String? title,
    String? restaurant,
    String? image,
    String? price,
  ) {
    return SelectedFood(
      title: title ?? this.title,
      restaurant: restaurant ?? this.restaurant,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}
