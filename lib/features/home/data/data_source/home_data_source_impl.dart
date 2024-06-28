import 'package:injectable/injectable.dart';
import '../services/home_service.dart';
import 'home_data_source.dart';

@Injectable(as: HomeDataSource)
abstract class HomeDataSourceImpl extends HomeDataSource {
  final HomeService _service;

  HomeDataSourceImpl(this._service);
}
