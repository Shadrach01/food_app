import 'package:flutter/material.dart';

class OtherLoginMeansWidgets extends StatelessWidget {
  final String? imagePath;
  final void Function()? onTap;
  const OtherLoginMeansWidgets({super.key, this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(imagePath!),
      ),
    );
  }
}
