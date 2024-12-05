import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/is_chef/add_new_food/view/add_new_food_page.dart';
import 'package:food_app/features/is_chef/chef_food_list/view/chef_food_list_page.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/chef_home_page_widgets.dart';

class ChefDashBoard extends StatefulWidget {
  const ChefDashBoard({super.key});

  @override
  State<ChefDashBoard> createState() => _ChefDashBoardState();
}

class _ChefDashBoardState extends State<ChefDashBoard> {
  int index = 0;

  // Home Screens
  List<Widget> widgetList = const [
    ChefHomePageWidgets(),
    ChefFoodListPage(),
    AddNewFoodPage(),
    Text(
        'WHOD;VZHVOJNZGN;DUDVHILUISDGHKVIKGKSYGVKYSGKVYGSKGVKHGHSVHH VBHMVMSHV'),
    Text('WHOD;VZHVOJNZGN;GVOIFJLOFGGHL'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appKWhite.withOpacity(.93),
      body: widgetList[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: ColorRes.containerKColor,
        unselectedItemColor: ColorRes.appKGrey.withOpacity(.6),
        elevation: 2,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                ImageRes.chefPageHomeIcon,
              ),
              size: 30,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorRes.containerKColor.withOpacity(.2),
                border: Border.all(
                  color: ColorRes.containerKColor,
                  width: 2,
                ),
              ),
              child: Image.asset(
                ImageRes.plus,
                color: ColorRes.containerKColor,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                ImageRes.chefPageHomeIcon,
              ),
              size: 30,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                ImageRes.chefPageHomeIcon,
              ),
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
