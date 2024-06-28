
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'nav_service.dart';

part 'nav_service_impl.g.dart';

@RestApi()
@Injectable(as: NavService)
abstract class NavServiceImpl implements NavService {

@factoryMethod
  factory NavServiceImpl(@Named('Dio') Dio dio) => _NavServiceImpl(dio);
}
