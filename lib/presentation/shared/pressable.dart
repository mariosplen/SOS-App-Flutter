import 'package:flutter/material.dart';

class Pressable extends StatelessWidget {
  const Pressable({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = BorderRadius.zero,
  });
  final Widget child;
  final Function()? onTap;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          child,
          Positioned(
            top: 0,
            left: 0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
