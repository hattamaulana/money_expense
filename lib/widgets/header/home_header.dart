import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'home_header'.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 4),
          Text(
            'home_header_desc'.tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}