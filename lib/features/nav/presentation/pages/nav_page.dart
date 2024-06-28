import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_client/core/utilities/configs/colors.dart';
import 'package:yalla_client/features/home/presentation/pages/home_page.dart';
import 'package:yalla_client/features/nav/domain/entities/nav_entity.dart';
import 'package:yalla_client/features/nav/presentation/widgets/custom_button_nav_widget.dart';
import 'package:yalla_client/gen/assets.gen.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => NavPageState();
}

class NavPageState extends State<NavPage> {
  NavEntity currentPage =
      NavEntity(Assets.images.icHome, 'الرئيسية', const HomePage());
  NavEntity profilePage() {
    return NavEntity(
      Assets.images.icProfile,
      'الحساب',
      const SizedBox.shrink(),
    );
  }

  NavEntity searchPage() {
    return NavEntity(
      Assets.images.icSearch,
      'البحث',
      const SizedBox.shrink(),
    );
  }

  NavEntity ordersPage() {
    return NavEntity(
      Assets.images.icOrders,
      'طلابتي',
      const SizedBox.shrink(),
    );
  }

  NavEntity homePage() {
    return NavEntity(
      Assets.images.icHome,
      'الرئيسية',
      const HomePage(),
    );
  }

  late List<NavEntity> navPages = [
    profilePage(),
    searchPage(),
    ordersPage(),
    homePage(),
  ];

  changePageWithIndex(int index) {
    setState(() {
      currentPage = navPages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage.page,
      bottomNavigationBar: BottomAppBar(
          height: 50,
          padding: EdgeInsets.only(top: 10.sp),
          elevation: 3,
          color: AllColors.whiteBase,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                navPages.length,
                (index) => CustomButtonNavWidget(
                      onTap: () {
                        if (currentPage != navPages[index]) {
                          changePageWithIndex(index);
                        }
                      },
                      icon: navPages[index].icon,
                      title: navPages[index].title,
                      selected: currentPage.title == navPages[index].title,
                    )),
          )),
    );
  }
}
