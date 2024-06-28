import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yalla_client/core/utilities/configs/app_typography.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home/home_entity.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home_component/home_component_entity.dart';
import 'package:yalla_client/features/home/domain/entities/home_entity/home_component/home_component_type_enum.dart';
import 'package:yalla_client/features/home/presentation/widgets/banner_item.dart';
import 'package:yalla_client/features/home/presentation/widgets/dot_indecator.dart';
import 'package:yalla_client/features/home/presentation/widgets/category_item.dart';
import 'package:yalla_client/features/home/presentation/widgets/shop_item.dart';
import 'package:yalla_client/gen/assets.gen.dart';
import 'package:yalla_client/translations/locale_keys.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fillHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            _buildHomeLocation(context),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeEntity.components.length,
                itemBuilder: (ctx, index) {
                  HomeComponentEntity componentEntity =
                      homeEntity.components[index];
                  if (componentEntity.type == HomeComponentTypeEnum.banner) {
                    return _buildHomeBanner(componentEntity);
                  } else if (componentEntity.type ==
                      HomeComponentTypeEnum.category) {
                    return _buildHomeCategories(componentEntity);
                  } else if (componentEntity.type ==
                      HomeComponentTypeEnum.store) {
                    return _buildHomeStoreSection(componentEntity);
                  } else {
                    return const SizedBox.shrink();
                  }
                })
          ],
        ),
      ),
    );
  }

  Column _buildHomeStoreSection(HomeComponentEntity componentEntity) {
    return Column(
      children: [
        _buildHomeSectionTitle(componentEntity.name),
        SizedBox(
          height: 220,
          width: 400,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: componentEntity.shops.length,
              itemBuilder: (ctx, index) {
                return ShopItem(entity: componentEntity.shops[index]);
              }),
        )
      ],
    );
  }

  Widget _buildHomeCategories(HomeComponentEntity componentEntity) {
    int hight = (componentEntity.categories.length / 3).ceil();
    return Column(
      children: [
        _buildHomeSectionTitle(componentEntity.name),
        SizedBox(
          height: hight * 130,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: componentEntity.categories.length,
              padding: EdgeInsets.all(8.sp),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (ctx, index) {
                return CategoryItem(
                  entity: componentEntity.categories[index],
                );
              }),
        ),
      ],
    );
  }

  Padding _buildHomeSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: cm20,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.more.tr(),
                style: cm18.copyWith(color: AllColors.blue),
              ),
              SizedBox(
                width: 16.w,
              ),
              SvgPicture.asset(Assets.images.icArrowMore)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHomeLocation(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.setLocale(Locale('ar'));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
            decoration: BoxDecoration(
                color: AllColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.sp)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.deliverTo.tr()),
                    Text('الموقع'),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                SvgPicture.asset(Assets.images.icArrowDown)
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AllColors.white,
      title: Text(
        'اهلا: مصطفي',
        style: cm20,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Badge(
              backgroundColor: AllColors.yellow,
              isLabelVisible: true,
              offset: const Offset(10, -5),
              textStyle: al14,
              textColor: AllColors.white,
              label: const Text(
                '2',
              ),
              child: SvgPicture.asset(Assets.images.icCart),
            ))
      ],
    );
  }

  Widget _buildHomeBanner(HomeComponentEntity componentEntity) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 0.9,
    );
    return SizedBox(
      height: 240.h,
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: componentEntity.banners.length,
              itemBuilder: (ctx, index) {
                return BannerItem(
                  entity: componentEntity.banners[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          DotsIndicator(
              controller: pageController,
              itemCount: componentEntity.banners.length),
        ],
      ),
    );
  }
}
