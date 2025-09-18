import 'package:flutter/material.dart';

class DOTSelectorField extends StatelessWidget {
  final VoidCallback onTap;
  final Widget leadingIcon;
  final String text;
  final Widget trailingIcon;

  const DOTSelectorField({
    super.key,
    required this.onTap,
    required this.leadingIcon,
    required this.text,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            leadingIcon,
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            const Spacer(),
            trailingIcon,
          ],
        ),
      ),
    );
  }
}