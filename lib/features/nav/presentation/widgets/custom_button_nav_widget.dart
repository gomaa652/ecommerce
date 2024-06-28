// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_client/core/utilities/configs/app_typography.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';

class CustomButtonNavWidget extends StatelessWidget {
  final bool selected;
  final String icon;
  final String title;
  final Function onTap;
  const CustomButtonNavWidget(
      {super.key,
      required this.selected,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: title.isEmpty ? 40.h : 20.h,
              width: title.isEmpty ? 30.w : 20.w,
              color: title.isEmpty
                  ? null
                  : selected
                      ? AllColors.blue
                      : AllColors.grey,
            ),
            if (title.isNotEmpty)
              SizedBox(
                height: 5.h,
              ),
            if (title.isNotEmpty)
              Text(title,
                  overflow: TextOverflow.ellipsis,
                  style: cr10.copyWith(
                      color: selected ? AllColors.blue : AllColors.grey)),
          ],
        ),
      ),
    );
  }
}
