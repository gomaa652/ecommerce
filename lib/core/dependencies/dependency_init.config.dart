// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/data_source/home_data_source.dart' as _i10;
import '../../features/home/data/services/home_service.dart' as _i12;
import '../../features/home/data/services/home_service_impl.dart' as _i13;
import '../../features/home/domain/repositories/home_repository.dart' as _i8;
import '../../features/home/domain/repositories/home_repository_impl.dart'
    as _i9;
import '../../features/home/domain/use_case/load_home_use_case.dart' as _i11;
import '../../features/nav/data/data_source/nav_data_source.dart' as _i6;
import '../../features/nav/data/services/nav_service.dart' as _i14;
import '../../features/nav/data/services/nav_service_impl.dart' as _i15;
import '../../features/nav/domain/repositories/nav_repository.dart' as _i4;
import '../../features/nav/domain/repositories/nav_repository_impl.dart' as _i5;
import '../utilities/app_data_storage.dart' as _i3;
import 'register_module.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.DataStorage>(() => _i3.DataStorage());
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i4.NavRepository>(
      () => _i5.NavRepositoryImpl(gh<_i6.NavDataSource>()));
  gh.lazySingleton<_i7.Dio>(
    () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')),
    instanceName: 'Dio',
  );
  gh.factory<_i8.HomeRepository>(
      () => _i9.HomeRepositoryImpl(gh<_i10.HomeDataSource>()));
  gh.factory<_i11.LoadHomeUseCase>(
      () => _i11.LoadHomeUseCase(gh<_i8.HomeRepository>()));
  gh.lazySingleton<_i7.Dio>(
    () => registerModule.dioInterceptor(gh<String>(instanceName: 'BaseUrl')),
    instanceName: 'Interceptor',
  );
  gh.factory<_i12.HomeService>(
      () => _i13.HomeServiceImpl(gh<_i7.Dio>(instanceName: 'Dio')));
  gh.factory<_i14.NavService>(
      () => _i15.NavServiceImpl(gh<_i7.Dio>(instanceName: 'Dio')));
  return getIt;
}

class _$RegisterModule extends _i16.RegisterModule {}
