import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

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
      backgroundColor: AppColors.sidebarBackground,
      indicatorColor: colors.primary,
      selectedIconTheme: IconThemeData(
        color: AppColors.sidebarOnBackground,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.sidebarOnBackgroundVariant,
      ),
      selectedLabelTextStyle: TextStyle(
        color: AppColors.sidebarSelectedLabel,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: AppColors.sidebarOnBackgroundVariant,
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(Icons.school, color: AppColors.sidebarOnBackground),
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
