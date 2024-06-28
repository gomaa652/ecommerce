import 'package:injectable/injectable.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home/home_entity.dart';

import '../../../../../../core/network/data_state.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/home_repository.dart';

@Injectable()
class LoadHomeUseCase implements UseCase<DataState<HomeEntity>, void> {
  final HomeRepository _repository;

  LoadHomeUseCase(this._repository);

  @override
  Future<DataState<HomeEntity>> call({params}) {
    return _repository.loadHomeComponents();
  }
}
