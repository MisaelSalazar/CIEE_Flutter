import 'package:flutter/material.dart';

import '../../widgets/aside_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<MenuOption> _options = [
    MenuOption(
      label: 'Inicio',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
    ),
    MenuOption(
      label: 'Incidencias',
      icon: Icons.warning_amber_outlined,
      selectedIcon: Icons.warning_amber,
    ),
    MenuOption(
      label: 'Eventos',
      icon: Icons.event_outlined,
      selectedIcon: Icons.event,
    ),
    MenuOption(
      label: 'Grados',
      icon: Icons.school_outlined,
      selectedIcon: Icons.school,
    ),
    MenuOption(
      label: 'Grupos',
      icon: Icons.group_outlined,
      selectedIcon: Icons.group,
    ),
    MenuOption(
      label: 'Personal',
      icon: Icons.badge_outlined,
      selectedIcon: Icons.badge,
    ),
    MenuOption(
      label: 'Permisos',
      icon: Icons.verified_user_outlined,
      selectedIcon: Icons.verified_user,
    ),
    MenuOption(
      label: 'Configuración',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final option = _options[_selectedIndex];

    return Scaffold(
      backgroundColor: colors.surfaceContainerLowest,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AsideMenu(
                extended: isWide,
                options: _options,
                selectedIndex: _selectedIndex,
                onSelect: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(option),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: _buildPlaceholder(colors, option),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(MenuOption option) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(bottom: BorderSide(color: colors.outlineVariant)),
      ),
      child: Text(
        option.label,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.onSurface,
            ),
      ),
    );
  }

  Widget _buildPlaceholder(ColorScheme colors, MenuOption option) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Card(
          elevation: 0,
          color: colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: colors.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    option.icon,
                    size: 40,
                    color: colors.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  option.label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.onSurface,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pantalla en construcción',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}