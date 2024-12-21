import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/food_category_container.dart';
import 'package:food_app/core/common/widgets/shimmer_widget.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_user/food_details/provider/selected_food_model_provider.dart';
import 'package:food_app/features/is_user/home_page/providers/home_page_service_provider.dart';
import 'package:go_router/go_router.dart';

class PopularFoodGridLayout extends ConsumerWidget {
  final String foodType;

  const PopularFoodGridLayout({
    super.key,
    required this.foodType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(availableFoodProvider(foodType));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular food",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
            height: 380,
            child: foodList.when(
              data: (foods) {
                if (foods.isEmpty) {
                  // Show the message if there are no foods
                  return const Center(
                    child: Text(
                      "There is no food in this category yet, please select from other categories",
                      style: TextStyle(
                        fontSize:
                            16, // Adjusted font size for better layout
                        color: ColorRes.containerKColor,
                      ),
                      textAlign:
                          TextAlign.center, // Center align the text
                    ),
                  );
                }

                // Show the grid if foods are available
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 20,
                    childAspectRatio: .9,
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return FoodCategoryContainer(
                      onTap: () {
                        ref
                            .read(selectedFoodModelProvider.notifier)
                            .state = food;
                        context.push(AppRouteNames.foodDetailsRoute);
                      },

                      // food.foodName != null
                      //     ? () => context.push('/foodDetails')
                      //     : null,
                      image: food.foodImages != null &&
                              food.foodImages!.isNotEmpty
                          ? DecorationImage(
                              image:
                                  NetworkImage(food.foodImages![0]),
                              fit: BoxFit.cover,
                            )
                          : null,
                      imagePlaceholder: const ShimmerWidget(
                        height: 150,
                        width: double.infinity,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                      ),
                      title: food.foodName != null
                          ? Text(
                              food.foodName!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const ShimmerWidget(
                              height: 20,
                              width: 100,
                            ),
                      subTitle: food.foodDetails != null
                          ? Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food.foodDetails!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: ColorRes.appKGrey,
                                    fontSize: 13,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${food.price ?? '0.00'}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color:
                                            ColorRes.containerKColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: ColorRes.appKWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const Column(
                              children: [
                                ShimmerWidget(height: 15, width: 150),
                                SizedBox(height: 8),
                                ShimmerWidget(height: 15, width: 50),
                              ],
                            ),
                    );
                  },
                );
              },
              error: (err, stack) => Text('Error: $err'),
              loading: () => GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20,
                  childAspectRatio: .9,
                ),
                itemCount: 5,
                // Show shimmer skeletons for 5 items
                itemBuilder: (context, index) {
                  return const FoodCategoryContainer(
                    image: null,
                    imagePlaceholder: ShimmerWidget(
                      height: 150,
                      width: double.infinity,
                      borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                    ),
                    title: ShimmerWidget(height: 20, width: 100),
                    subTitle: Column(
                      children: [
                        ShimmerWidget(height: 15, width: 150),
                        SizedBox(height: 8),
                        ShimmerWidget(height: 15, width: 50),
                      ],
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}
