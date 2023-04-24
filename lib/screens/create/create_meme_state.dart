class CreateMemeState {
  CreateMemeState({this.body = '', this.isLoading = false});

  final String body;
  final bool isLoading;

  CreateMemeState copyWith({String? body, bool? isLoading}) {
    return CreateMemeState(
      body: body ?? this.body,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
