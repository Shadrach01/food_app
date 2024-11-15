import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dot_index_provider.g.dart';

// RIVERPOD PROVIDER TO MANAGE THE STATE OF THE INDEX PROVIDER
// FOR THE ONBOARDING STATE

@riverpod
class IndexDot extends _$IndexDot {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int value) {
    state = value;
  }
}
