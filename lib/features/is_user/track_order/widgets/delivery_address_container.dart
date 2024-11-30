import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/core/utils/text_res.dart';

class DeliveryAddressContainer extends StatefulWidget {
  const DeliveryAddressContainer({super.key});

  @override
  State<DeliveryAddressContainer> createState() =>
      _DeliveryAddressContainerState();
}

class _DeliveryAddressContainerState
    extends State<DeliveryAddressContainer> {
  late DraggableScrollableController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
    _controller.addListener(() {
      setState(() {
        _isExpanded = _controller.size > 0.3;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: 0.21,
      minChildSize: 0.21,
      maxChildSize: 0.7,
      builder: (context, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: ColorRes.appKWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              // Scrollable content
              Expanded(
                child: ListView(
                  controller: controller,
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 20,
                    left: 20,
                  ),
                  children: [
                    const Divider(
                      thickness: 6,
                      indent: 150,
                      endIndent: 150,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            color: ColorRes.appKLightGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Utora Coffee House",
                              style: TextStyle(
                                color: ColorRes.appKGrey,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text("Ordered at 06 Sept, 10:00pm"),
                            const SizedBox(height: 15),
                            RichText(
                              text: const TextSpan(
                                text: "3x ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.appKGrey,
                                  fontSize: 15,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Burger",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            RichText(
                              text: const TextSpan(
                                text: "4x ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.appKGrey,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sandwich",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            deliveryTime(),
                            const SizedBox(height: 20),
                            orderMovementDetails(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Show the Courier call widget if the sheet is expanded only
              if (_isExpanded) courierCall(),
            ],
          ),
        );
      },
    );
  }
}

// Delivery time widget
Widget deliveryTime() {
  return Column(
    children: [
      const Text(
        "20 min",
        style: TextStyle(
          color: ColorRes.appKDarkBlack,
          fontWeight: FontWeight.w900,
          fontSize: 40,
        ),
      ),
      Text(
        TextRes.deliveryTime.toUpperCase(),
        style: const TextStyle(
          color: ColorRes.appKGrey,
          fontSize: 15,
        ),
      )
    ],
  );
}

//Order delivery movement details
Widget orderMovementDetails() {
  return const SizedBox(
    height: 50,
    child: Column(
      children: [
        Row(
          children: [],
        )
      ],
    ),
  );
}

Widget courierCall() {
  return Container(
    height: 110,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      // color: ColorRes.containerKColor,
      border: Border.all(color: ColorRes.appKLightGrey),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 25,
          child: Image.asset(
            ImageRes.cross,
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: TextStyle(
                color: ColorRes.appKDarkBlack,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "Courier",
              style: TextStyle(
                color: ColorRes.appKGrey,
              ),
            ),
          ],
        ),
        const SizedBox(width: 70),
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            color: ColorRes.containerKColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            ImageRes.call,
            color: ColorRes.appKWhite,
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: ColorRes.appKWhite,
            shape: BoxShape.circle,
            border: Border.all(color: ColorRes.containerKColor),
          ),
          child: Image.asset(
            ImageRes.message,
            color: ColorRes.containerKColor,
          ),
        ),
      ],
    ),
  );
}
