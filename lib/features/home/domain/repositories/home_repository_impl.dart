import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:yalla_client/core/network/data_state.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home/home_entity.dart';
import '../../data/data_source/home_data_source.dart';
import 'home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

  @override
  Future<DataState<HomeEntity>> loadHomeComponents() async {
    HomeEntity home = fillHomeData();
    return DataSuccess(home);
  }
}
