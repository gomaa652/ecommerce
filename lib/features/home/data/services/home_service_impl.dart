
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'home_service.dart';

part 'home_service_impl.g.dart';

@RestApi()
@Injectable(as: HomeService)
abstract class HomeServiceImpl implements HomeService {

@factoryMethod
  factory HomeServiceImpl(@Named('Dio') Dio dio) => _HomeServiceImpl(dio);
}
