
import 'package:yalla_client/features/home/domain/entities/banner/banner_entity.dart';
import 'package:yalla_client/features/home/domain/entities/category/category_entity.dart';
import 'package:yalla_client/features/home/domain/entities/shop_entity/shop_entity.dart';
import 'home_component_type_enum.dart';

class HomeComponentEntity {
  HomeComponentTypeEnum type;
  List<BannerEntity> banners;
  List<CategoryEntity> categories;
  String name;
  String targetId;
  List<ShopEntity> shops;
  HomeComponentEntity({
    required this.type,
    required this.banners,
    required this.categories,
    required this.name,
    required this.targetId,
    required this.shops,
  });

 

  
}
