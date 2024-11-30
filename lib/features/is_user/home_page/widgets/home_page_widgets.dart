import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/is_user/home_page/widgets/all_categories.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import '../../search_page/widgets/search_bar_container.dart';
import '../providers/home_page_service_provider.dart';
import 'open_restaurants.dart';

class HomePageWidgets extends ConsumerWidget {
  final searchBarController = TextEditingController();

  final focusNode = FocusNode();

  HomePageWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNameProvider);
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          homePageAppBar(
            context,
          ),
          const SizedBox(height: 25),
          user.when(
            data: (userName) {
              if (userName == null) {
                return const Text("No user name found");
              }

              return Row(
                children: [
                  Text(
                    "Hey $userName, ",
                    style: const TextStyle(fontSize: 16),
                  ),
                  // SizedBox(width: 10),
                  const Text(
                    "Good Afternoon",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            },
            error: (err, stack) => Text("Error: $err"),
            loading: () => const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 20),
          SearchBarContainer(
              controller: searchBarController,
              focusNode: focusNode,
              onTap: () {
                // Hide the device keyboard before navigating
                focusNode.unfocus();

                // Navigate to the search page
                context.push(
                  '/homeSearchPage',
                );
              }),
          const SizedBox(height: 30),
          const AllCategories(),
          const SizedBox(height: 30),
          const Expanded(
            child: OpenRestaurants(),
          ),
        ],
      ),
    );
  }

  // App bar for the home page from the custom App AppBar
  Widget homePageAppBar(BuildContext context) {
    return CustomAppBar(
      leadIcon: Image.asset(
        ImageRes.menu,
      ),
      onLeadTapped: () => context.push('/profilePage'),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "DELIVER TO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorRes.containerKColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Dumaks Office",
              ),
              const SizedBox(width: 5),
              Image.asset(
                ImageRes.polygon,
                width: 15,
                height: 15,
              )
            ],
          ),
        ],
      ),
      trailingIcon: Badge(
        label: const Text("2"),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: ColorRes.containerKColor,
        textColor: ColorRes.appKWhite,
        offset: const Offset(-10, 0),
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorRes.appKDarkBlack,
          ),
          child: const Center(
            child: Icon(
              Icons.shopping_bag_outlined,
              color: ColorRes.appKWhite,
            ),
          ),
        ),
      ),
      onTrailingTapped: () => context.push('/myOrders'),
    );
  }
}
