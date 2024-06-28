// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_client/core/utilities/configs/app_typography.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';

class AppButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final String? counter;
  final String? subTitle;
  final bool? isSec;
  final bool? isBold;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.onPress,
    required this.title,
    this.isSec = false,
    this.isBold = false,
    this.icon,
    this.counter = '',
    this.subTitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: _buildButtonStyle(),
        child: _buildButtonRow(),
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15)),
      textStyle: MaterialStateProperty.all(
        (isBold! ? ab20 : am20)
            .copyWith(color: isSec! ? AllColors.blue : AllColors.white),
      ),
      foregroundColor:
          MaterialStateProperty.all(isSec! ? AllColors.blue : AllColors.white),
      backgroundColor:
          MaterialStateProperty.all(isSec! ? AllColors.white : AllColors.blue),
      overlayColor: MaterialStateProperty.all(
          (isSec! ? AllColors.blue : AllColors.white).withOpacity(0.2)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.sp,
          ),
          side: BorderSide(color: AllColors.blue, width: 1.sp),
        ),
      ),
    );
  }

  Row _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title.isNotEmpty) _buildButtonText(title),
        if (title.isNotEmpty && subTitle!.isNotEmpty)
          SizedBox(
            width: 4.w,
          ),
        if (subTitle != null) _buildButtonText(subTitle!),
        if (title.isNotEmpty && counter!.isNotEmpty)
          SizedBox(
            width: 32.w,
          ),
        if (counter!.isNotEmpty)
          CircleAvatar(
            radius: 20.h,
            backgroundColor: AllColors.darkBlue.withOpacity(0.4),
            child: Center(
              child: Text(
                counter.toString(),
                textAlign: TextAlign.center,
                style:
                    (isBold! ? ab20 : am20).copyWith(color: AllColors.yellow),
              ),
            ),
          ),
        if (icon != null && title.isNotEmpty)
          SizedBox(
            width: 16.w,
          ),
        if (icon != null) icon!,
      ],
    );
  }

  Text _buildButtonText(String text) {
    return Text(
      text,
      style: (isBold! ? ab20 : am20)
          .copyWith(color: isSec! ? AllColors.blue : AllColors.white),
    );
  }
}
