import 'package:flutter/material.dart';

class MenuOption {
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const MenuOption({
    required this.label,
    required this.icon,
    IconData? selectedIcon,
  }) : selectedIcon = selectedIcon ?? icon;
}

class AsideMenu extends StatelessWidget {
  final List<MenuOption> options;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final bool extended;

  const AsideMenu({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
    this.extended = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return NavigationRail(
      extended: extended,
      scrollable: true,
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelect,
      backgroundColor: colors.surface,
      indicatorColor: colors.secondaryContainer,
      selectedIconTheme: IconThemeData(color: colors.onSecondaryContainer),
      unselectedIconTheme: IconThemeData(color: colors.onSurfaceVariant),
      selectedLabelTextStyle: TextStyle(
        color: colors.onSurface,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelTextStyle: TextStyle(color: colors.onSurfaceVariant),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.school, color: colors.onPrimaryContainer),
          ),
        ),
      ),
      destinations: [
        for (final option in options)
          NavigationRailDestination(
            icon: Icon(option.icon),
            selectedIcon: Icon(option.selectedIcon),
            label: Text(option.label),
          ),
      ],
    );
  }
}
