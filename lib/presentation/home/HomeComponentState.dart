import 'package:c3_offline/api/client/api_result.dart';

class HomeComponentState<T>{
  final bool isLoading;
  final T? data;
  final Failure? failure;
  const HomeComponentState({
    this.isLoading = false,
    this.data,
    this.failure
});

  HomeComponentState<T> copyWith({
    bool? isLoading,
    T? data,
    Failure? failure,
  }) {
    return HomeComponentState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      failure: failure ?? this.failure,
    );
  }
}