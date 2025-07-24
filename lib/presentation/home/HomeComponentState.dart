import 'package:c3_offline/api/client/api_result.dart';
import 'package:equatable/equatable.dart';

class HomeComponentState<T> extends Equatable {
  final bool isLoading;
  final T? data;
  final Failure? failure;
  const HomeComponentState({
    this.isLoading = false,
    this.data,
    this.failure
});

  @override
  List<Object?> get props => [isLoading, data, failure];

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