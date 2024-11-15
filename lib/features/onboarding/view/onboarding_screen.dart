import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/core/utils/text_res.dart';
import 'package:food_app/features/onboarding/provider/dot_index_provider.dart';
import 'package:food_app/features/onboarding/widgets/onboarding_buttons.dart';
import 'package:food_app/features/onboarding/widgets/onboarding_widgets.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
// ref access to the dot index provider
    final index = ref.watch(indexDotProvider);

    return Scaffold(
      backgroundColor: ColorRes.appKWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (value) =>
                  ref.read(indexDotProvider.notifier).changeIndex(value),
              children: [
                OnboardingWidgets(
                  title: TextRes.onboardingTitle1,
                  subTitle: TextRes.onboardingSubTitle,
                  index: index,
                  image: ImageRes.onboarding_1,
                ),
                OnboardingWidgets(
                  title: TextRes.onboardingTitle1,
                  subTitle: TextRes.onboardingSubTitle,
                  index: index,
                  image: ImageRes.onboarding_2,
                ),
                OnboardingWidgets(
                  title: TextRes.onboardingTitle3,
                  subTitle: TextRes.onboardingSubTitle,
                  index: index,
                  image: ImageRes.onboarding_3,
                ),
                OnboardingWidgets(
                  title: TextRes.onboardingTitle4,
                  subTitle: TextRes.onboardingSubTitle,
                  index: index,
                  image: ImageRes.onboarding_4,
                ),
              ],
            ),
            Positioned(
              right: 15,
              left: 15,
              bottom: 30,
              child: OnboardingButtons(
                controller: _controller,
                index: index,
              ),
            )
          ],
        ),
      ),
    );
  }
}
