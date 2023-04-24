// String VS TextEditingController?
// Using TextEditingController seems
// This means provides more functionality for form validation and listening to changes,
// But is it being disposed? via StateNotifierProvider.autoDispose. what if its disposed incorrectly?
// Using Strings means having to call the update state on provider on 'OnChange'

class LoginState {
  LoginState({this.email = '', this.password = '', this.isLoading = false});

  final String email;
  final String password;

  final bool isLoading;

  LoginState copyWith({String? email, String? password, bool? isLoading}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
