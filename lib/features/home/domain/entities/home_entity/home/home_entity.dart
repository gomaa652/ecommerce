import 'package:yalla_client/features/home/domain/entities/banner/banner_entity.dart';
import 'package:yalla_client/features/home/domain/entities/category/category_entity.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home_component/home_component_type_enum.dart';
import 'package:yalla_client/features/home/domain/entities/shop_entity/shop_entity.dart';

import '../home_component/home_component_entity.dart';

class HomeEntity {
  List<HomeComponentEntity> components;

  HomeEntity({
    required this.components,
  });
}

List<HomeComponentEntity> components = [];

HomeEntity homeEntity = HomeEntity(components: components);
CategoryEntity categoryEntity = CategoryEntity(
  id: 1,
  image:
      "https://s3-alpha-sig.figma.com/img/8ef6/888e/5fb00aef70f3f762d3acf433795972a1?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MeGZHgqxl9oom8d8eBYCPQNaTmLyfolpHJQTPHpjwFyoqLI4mMNloubp4PFpPXLldv73wajtmisPQKsxR65rwImtEb6FnbtesJtipJi2RYPVX~WCJ1-xKpWrth2xyc9EsRK8VG02e4UE3f4wAiN~AY6BXMLJnQDqbMfrUFnKja0w~T~6xE5rj6jK4DvChFjKv~pk55RUbjeJb3278eqGeEh8NW6nWI0e2g-40kE-px-B2Ewq0i~hngnkvFKfQx8L0ESJ8Pqt6HzddbKeE34TTXSujX0yhSsxhF68Cwnr5OvNSJR~0uYtL05ZuXL1lfqN9SzHHC~Ff4bRCR65Uzhbfw__",
  name: 'الافطار',
);

BannerEntity bannerEntity = BannerEntity(
  id: 1,
  url:
      "https://s3-alpha-sig.figma.com/img/13c6/f669/15d71eb441fd49197304c70f207563e2?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KJl51Q23t7saeelBaLvjoK~Hx7xySRDbylde6XdqtUwReQBJvXnyMtR-2ZOgKBi33fPNdLSt3A-I2L-bsKhTa92tID5gk5PVRjcqYIYLLo63EpGOLvqm1t4I-n-rcrDfKLL~lo8VqFZMkCaZ9GpUoNkPTC0UOByCDqm~ClH8AjFRvgfv0YLZKy6kFZwLjZClGs~RlqCF6JeDdPJkdao~5bx~kztUQlLQ1DsIr6dALE4mD4e9Csj5f0hsHmq32oA-REcCGngV8HKAJHrmz0MyJua38ymVBJUA9vctidCWFZCo~nuehSe89BEuMB3KdQAuxlgwR4Ltby-oxUvnmJ9ykg__",
  type: BannerType.shop,
);

ShopEntity shopEntity = ShopEntity(
  id: 1,
  image:
      'https://s3-alpha-sig.figma.com/img/a142/d18a/ed0cff7bc730ec90a61a33fc4146df99?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Bd5Jky1tCiNmoA~RJ3Bzw8QqiUdGWAkcc7OC2dkl03aa2BBhzXuM-51nuBiBoQfrKRtI~4RN81Gu-kRXUdnKDuTUQ8CU8pcL1I1eJ-I2~Ncdl~W0--3aj6wOGVNm03ermCdT9grjUnwGzynaCbbHhg5d7jnkVOvBUKJ~DAHu3IYqvhWQKjydQrDNEDgUFpvqN9nKCwDyHQxiRf1pwqa1IQ3asKyvM9QO~ExXw9X2VrdonD0KZsu9dIXZjS5G8RdPLMOXapNwKLYSMXmfRTNURh4HxJ8il91gzfQeP0MgbygiV0EfKxGjCaH3DAxd5eoqKIiIaIU~fLAxFAQlN9YkXA__',
  name: "اسماك العربي ",
  desc: "سمك , جمبري , سوشي , ارز",
  isFavorite: false,
  hasWallet: false,
  duration: '25',
  rating: 2.4,
  sale: '20',
);

fillHomeData() {
  components = [];
  components.add(HomeComponentEntity(
      type: HomeComponentTypeEnum.banner,
      banners: [bannerEntity, bannerEntity, bannerEntity],
      categories: [],
      name: '',
      targetId: '1',
      shops: []));
  components.add(HomeComponentEntity(
      type: HomeComponentTypeEnum.category,
      banners: [],
      categories: [
        categoryEntity,
      ],
      name: 'يلا نطلب',
      targetId: '1',
      shops: []));

  components.add(HomeComponentEntity(
      type: HomeComponentTypeEnum.store,
      banners: [],
      categories: [],
      name: 'متاجر قريبه منك',
      targetId: '1',
      shops: [shopEntity, shopEntity, shopEntity]));

  components.add(HomeComponentEntity(
      type: HomeComponentTypeEnum.store,
      banners: [],
      categories: [],
      name: 'رشحنا لك',
      targetId: '1',
      shops: [shopEntity, shopEntity]));
}
