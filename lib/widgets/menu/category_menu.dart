import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryGridItem extends StatelessWidget {
  final String svgAsset;
  final String? label;
  final Color color;
  final VoidCallback? onTap;
  final bool useBackground;

  const CategoryGridItem({
    super.key,
    required this.svgAsset,
    required this.color,
    this.label,
    this.onTap,
    this.useBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (useBackground)
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: SvgPicture.asset(
                svgAsset,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.surface,
                  BlendMode.srcIn,
                ),
              ),
            ),

          if (!useBackground)
            Container(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                svgAsset,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),

          if (label != null)
            Text(
              label!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
        ],
      ),
    );
  }
}
