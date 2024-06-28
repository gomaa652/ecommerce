import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_client/core/utilities/configs/app_typography.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';
import 'package:yalla_client/features/home/domain/entities/category/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity entity;

  const CategoryItem({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(5.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: AllColors.yellowLight,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              entity.name,
              style: ar16.copyWith(color: AllColors.blue),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Center(
                  child: Image.network(
                    entity.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
