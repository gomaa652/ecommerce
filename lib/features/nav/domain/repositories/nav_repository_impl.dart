

import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import '../../data/data_source/nav_data_source.dart';
import 'nav_repository.dart';

@Injectable(as: NavRepository)
class NavRepositoryImpl extends NavRepository {
final NavDataSource _dataSource;


  NavRepositoryImpl(this._dataSource);


}
