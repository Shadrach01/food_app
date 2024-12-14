import 'package:flutter_riverpod/flutter_riverpod.dart';

// STATE PROVIDER TO STORE THE FOOD TITLE THAT IS CLICKED ON
final selectedFoodProvider = StateProvider<String?>((ref) => null);
