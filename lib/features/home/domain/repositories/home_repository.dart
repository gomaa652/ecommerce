import 'package:yalla_client/core/network/data_state.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home/home_entity.dart';

abstract class HomeRepository {
  Future<DataState<HomeEntity>> loadHomeComponents();
}
