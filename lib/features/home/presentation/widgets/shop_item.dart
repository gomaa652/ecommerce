import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla_client/core/utilities/configs/app_typography.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';
import 'package:yalla_client/features/home/domain/entities/shop_entity/shop_entity.dart';
import 'package:yalla_client/gen/assets.gen.dart';

class ShopItem extends StatelessWidget {
  final ShopEntity entity;

  const ShopItem({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.sp),
            bottomRight: Radius.circular(8.sp),
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          ),
        ),
        margin: EdgeInsets.all(16.sp),
        elevation: 2,
        child: Stack(
          children: [
            SizedBox(
              height: 160.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  entity.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (entity.duration.isNotEmpty)
                        Container(
                          padding: EdgeInsets.all(6.sp),
                          decoration: BoxDecoration(
                              color: AllColors.yellow,
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Row(
                            children: [
                              Text(
                                entity.duration,
                                textAlign: TextAlign.center,
                                style: al10.copyWith(color: AllColors.blue),
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              SvgPicture.asset(Assets.images.icClock),
                            ],
                          ),
                        ),
                      const Spacer(),
                      Row(
                        children: [
                          if (entity.hasWallet)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                  padding: EdgeInsets.all(6.sp),
                                  decoration: BoxDecoration(
                                      color: AllColors.yellow,
                                      borderRadius:
                                          BorderRadius.circular(10.sp)),
                                  child:
                                      SvgPicture.asset(Assets.images.icWallet)),
                            ),
                          Container(
                            padding: EdgeInsets.all(6.sp),
                            decoration: BoxDecoration(
                                color: AllColors.white,
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: SvgPicture.asset(
                              entity.isFavorite
                                  ? Assets.images.icFavoriteFill
                                  : Assets.images.icFavorite,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (entity.sale.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: EdgeInsets.all(6.sp),
                            decoration: BoxDecoration(
                                color: AllColors.yellow,
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Row(
                              children: [
                                Text(
                                  "خصم  يصل اللى ${entity.sale}%",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.almarai(
                                    textStyle: const TextStyle(
                                        color: AllColors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                SvgPicture.asset(Assets.images.icDiscount),
                              ],
                            )),
                      ],
                    ),
                  ),
                Container(
                  width: double.infinity,
                  height: 65,
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.sp),
                          bottomRight: Radius.circular(8.sp)),
                      color: AllColors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entity.name,
                            textAlign: TextAlign.center,
                            style: ar16,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(entity.desc,
                              textAlign: TextAlign.center, style: al14),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.images.icStar),
                          Text(entity.rating.toString(),
                              textAlign: TextAlign.center, style: al14),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
