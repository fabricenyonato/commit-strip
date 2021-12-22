import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.loading() = _Loading<T>;
  const factory DataState.error(Object error) = _Error<T>;
  const factory DataState.success(T data) = _Success<T>;
}
