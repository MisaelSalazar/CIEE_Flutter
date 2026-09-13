import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class FormCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? maxWidth;

  const FormCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(28),
    this.maxWidth = 420,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth!),
      child: Card(
        elevation: 0,
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: colors.outlineVariant),
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
