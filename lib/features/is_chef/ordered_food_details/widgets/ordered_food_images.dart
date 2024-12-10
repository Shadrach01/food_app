import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/onboarding/provider/dot_index_provider.dart';

class OrderedFoodImages extends ConsumerStatefulWidget {
  const OrderedFoodImages({super.key});

  @override
  ConsumerState<OrderedFoodImages> createState() =>
      _OrderedFoodImagesState();
}

class _OrderedFoodImagesState
    extends ConsumerState<OrderedFoodImages> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(indexDotProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              imageContainers(
                  _controller,
                  (value) => ref
                      .read(indexDotProvider.notifier)
                      .changeIndex(value)),
              Positioned.fill(
                left: 15,
                top: 160,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: ColorRes.appKWhite.withOpacity(.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Breakfast",
                          style: TextStyle(
                            color: ColorRes.appKDarkBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: ColorRes.appKWhite.withOpacity(.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Delivery",
                          style: TextStyle(
                            color: ColorRes.appKDarkBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                left: 30,
                top: 160,
                right: 30,
                child: DotsIndicator(
                  dotsCount: 5,
                  position: index,
                  decorator: DotsDecorator(
                    size: const Size(17, 12),
                    activeSize: const Size(25, 10),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    activeColor: ColorRes.appKWhite,
                    color: ColorRes.appKLightGrey,
                    spacing: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Chicken Thai Biriyani",
              style: TextStyle(
                color: ColorRes.appKDarkBlack,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "\$60",
              style: TextStyle(
                color: ColorRes.appKDarkBlack,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorRes.appKGrey,
                  size: 15,
                ),
                SizedBox(width: 6),
                Text("Shomolu"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorRes.containerKColor,
                  size: 20,
                ),
                // SizedBox(width: 7),
                Text(
                  "4.8",
                  style: TextStyle(
                    color: ColorRes.containerKColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "(20 Reviews)",
                  style: TextStyle(
                    color: ColorRes.appKGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget imageContainers(
    PageController controller,
    void Function(int) onPageChanged,
  ) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: const [
        AppContainer(
          height: 230,
          borderRadius: 20,
          containerColor: ColorRes.appKGrey,
          child: Row(),
        ),
        AppContainer(
          height: 230,
          borderRadius: 20,
          containerColor: ColorRes.appKGrey,
          child: Row(),
        ),
        AppContainer(
          height: 230,
          borderRadius: 20,
          containerColor: ColorRes.appKGrey,
          child: Row(),
        ),
        AppContainer(
          height: 230,
          borderRadius: 20,
          containerColor: ColorRes.appKGrey,
          child: Row(),
        ),
        AppContainer(
          height: 230,
          borderRadius: 20,
          containerColor: ColorRes.appKGrey,
          child: Row(),
        ),
      ],
    );
  }
}
