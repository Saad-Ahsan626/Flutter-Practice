import 'package:flutter_riverpod/flutter_riverpod.dart';

// final MyProvider = StateProvider<AppState>((ref) {
//   return AppState(count: 0, isRadioOn: false);
// });

class AppState {
  int count;
  bool isRadioOn;

  AppState({required this.count, required this.isRadioOn});

  AppState copyWith({int? count, bool? isRadioOn}) {
    return AppState(
      count: count ?? this.count,
      isRadioOn: isRadioOn ?? this.isRadioOn,
    );
  }
}

// This is for State Notifier Provider
class AppStateNotifier extends StateNotifier<AppState> {

  AppStateNotifier() : super(AppState(count: 0, isRadioOn: false));

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void toggleRadio(bool value) {
    state = state.copyWith(isRadioOn: value);
  }
}

final MyStateNotifierProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});