import 'package:flutter_riverpod/flutter_riverpod.dart';

final MyProvider = StateProvider<AppState>((ref) {
  return AppState(count: 0, isRadioOn: false);
});

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
