part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    bool? isLoading,
    HomeEntity? homeEntity,
    String? errorMessage,
  }) = _HomeState;
}
