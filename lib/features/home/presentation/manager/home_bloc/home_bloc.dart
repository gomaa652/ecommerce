import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yalla_client/core/dependencies/dependency_init.dart';
import 'package:yalla_client/core/network/data_state.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home/home_entity.dart';
import 'package:yalla_client/features/home/domain/use_case/load_home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoadHomeUseCase _loadHomeUseCase = getIt<LoadHomeUseCase>();

  HomeBloc(_loadHomeUseCase) : super(HomeState()) {
    on<_LoadHomeComponentsEvent>(_loadHomeComponents);
  }

  Future<void> _loadHomeComponents(
      _LoadHomeComponentsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final DataState<HomeEntity> dataState = await _loadHomeUseCase.call();
    if (dataState is DataSuccess) {
      emit(state.copyWith(
        homeEntity: dataState.data!,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: dataState.error,
      ));
    }
  }
}
