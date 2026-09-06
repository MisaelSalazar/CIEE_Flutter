import 'package:flutter/material.dart';

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
              borderRadius: BorderRadius.circular(14),
            ),
            child: TabBar(
              isScrollable: isScrollable,
              dividerColor: Colors.transparent,
              labelColor: colors.onSurface,
              unselectedLabelColor: colors.onSurfaceVariant,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
              indicator: BoxDecoration(
                color: colors.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
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