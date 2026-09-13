import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppTabs extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> children;
  final bool isScrollable;

  const AppTabs({
    super.key,
    required this.tabs,
    required this.children,
    this.isScrollable = false,
  }) : assert(tabs.length == children.length);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.outlineVariant),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: TabBar(
              isScrollable: isScrollable,
              dividerColor: Colors.transparent,
              labelColor: colors.onPrimaryContainer,
              unselectedLabelColor: colors.onSurfaceVariant,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
              indicator: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [for (final tab in tabs) Tab(text: tab)],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TabBarView(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}