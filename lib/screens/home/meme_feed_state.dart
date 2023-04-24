// String VS TextEditingController?
// Using TextEditingController seems
// This means provides more functionality for form validation and listening to changes,
// But is it being disposed? via StateNotifierProvider.autoDispose. what if its disposed incorrectly?
// Using Strings means having to call the update state on provider on 'OnChange'

class MemeFeedState {
  MemeFeedState({ this.isLoading = false});

  final bool isLoading;

  MemeFeedState copyWith({String? email, String? password, bool? isLoading}) {
    return MemeFeedState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
