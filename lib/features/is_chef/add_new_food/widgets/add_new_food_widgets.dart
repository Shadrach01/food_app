import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/global_loader/global_loader.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/add_new_food/controller/add_new_food_controller.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_notifier.dart';
import 'package:food_app/features/is_chef/add_new_food/widgets/ingredients_widget.dart';
import 'package:food_app/features/is_chef/add_new_food/widgets/price_and_delivery.dart';
import 'package:food_app/features/is_chef/add_new_food/widgets/upload_food_image_widgets.dart';
import 'package:go_router/go_router.dart';

class AddNewFoodWidgets extends ConsumerWidget {
  final controller = AddNewFoodController();

  AddNewFoodWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(appLoaderProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              onLeadTapped: () =>
                  context.go(AppRouteNames.dashBoardRoute),
              title: const Text(
                "Add New Items",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorRes.appKDarkBlack,
                ),
              ),
              trailingIcon: const Text(
                "RESET",
                style: TextStyle(
                  color: ColorRes.containerKColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ITEM NAME",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorRes.appKDarkBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        AppTextfield(
                          hintText: "Chicken Biriyani",
                          controller: controller.foodNameController,
                          onChanged: (value) => ref
                              .read(
                                  addNewFoodNotifierProvider.notifier)
                              .onFoodNameChanged(value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const UploadFoodImageWidgets(),
                    const SizedBox(height: 20),
                    PriceAndDelivery(),
                    const SizedBox(height: 20),
                    IngredientsWidget(),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () =>
                          controller.addFoodToDatabase(context, ref),
                      child: AppContainer(
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: ColorRes.appKWhite,
                                ),
                              )
                            : const Text(
                                "UPLOAD FOOD",
                                style: TextStyle(
                                  color: ColorRes.appKWhite,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
