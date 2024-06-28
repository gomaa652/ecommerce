import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_client/features/home/domain/entities/banner/banner_entity.dart';

class BannerItem extends StatelessWidget {
  final BannerEntity entity;
  const BannerItem({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.sp),
        child: Image.network(
          entity.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
