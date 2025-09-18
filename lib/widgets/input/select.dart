import 'package:flutter/material.dart';

class DOTSelectorField extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? leadingIcon;
  final String text;
  final Widget trailingIcon;

  const DOTSelectorField({
    super.key,
    this.leadingIcon,
    required this.onTap,
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
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            if (leadingIcon != null) leadingIcon!,
            if (leadingIcon != null) const SizedBox(width: 12),
            
            Text(text,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            )),

            const Spacer(),

            trailingIcon,
          ],
        ),
      ),
    );
  }
}