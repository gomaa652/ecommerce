

import 'package:injectable/injectable.dart';
import '../services/nav_service.dart';
import 'nav_data_source.dart';

@Injectable(as: NavDataSource)
abstract class NavDataSourceImpl extends NavDataSource {
final NavService _service;


  NavDataSourceImpl(this._service);


}
