import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_e_commerce_app/presentaion/state_holders/bottom_nav_bar_controller.dart';
import 'package:simple_e_commerce_app/presentaion/ui/screens/new_list_screen.dart';
import 'package:simple_e_commerce_app/presentaion/ui/screens/popular_list_screen.dart';
import 'package:simple_e_commerce_app/presentaion/ui/screens/special_list%20screen.dart';
import 'package:simple_e_commerce_app/presentaion/ui/utils/assets_path.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_banner_slider.dart';
import '../widgets/horizontal_categories_listview.dart';
import '../widgets/horizontal_product_list_view.dart';
import '../widgets/search_text_field.dart';
import '../widgets/seciton_header.dart';
import 'category_list_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            SearchTextField(textEditingController: TextEditingController(),),
            const SizedBox(height: 16,),
            const HomeBannerSlider(),
            _buildCategoriesSection(),
            const SizedBox(height: 16,),
            _buildPopularProductsSection(),
            const SizedBox(height: 16,),
            _buildNewProductsSection(),
            const SizedBox(height: 16,),
            _buildSpecialProductsSection(),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
  Widget _buildPopularProductsSection(){
    return Column(
      children: [
        SectionHeader(
          title: 'Popular',
          onTap: () {
            Get.to(()=> PopularListScreen());
          },
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        )
      ],
    );
  }
  Widget _buildNewProductsSection(){
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: () {
            Get.to(()=>const NewListScreen());
            },
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        )
      ],
    );
  }
  Widget _buildSpecialProductsSection(){
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: () {
            Get.to(()=>const SpecialListScreen());
            },
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        )
      ],
    );
  }
  Widget _buildCategoriesSection() {
    // Categories & 'see all'
    return Column(
      children: [
        SectionHeader(
          title: 'Categories',
          onTap: () {
            // pressing 'see all' of Categories section then the bottom navbar of category automatically selected
            Get.find<BottomNavBarController>().selectCategory();
          },
        ),
        const SizedBox(
          height: 8,
        ),

        // list of Categories
        const SizedBox(
          height: 140,
          child: HorizontalCategorieListView(),
        )
      ],
    );
  }
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.applogoNav),
      actions: [
        AppBarIconButton(
          iconData: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 10,
        ),
        AppBarIconButton(
          iconData: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 10,
        ),
        AppBarIconButton(
          iconData: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}



