import 'package:flutter/material.dart';

import '../../widgets/event_list_item.dart';
import '../../widgets/incident_list_item.dart';
import '../../widgets/section_card.dart';
import '../../widgets/stat_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const _permisosCount = '2';
  static const _incidenciasCount = '8';
  static const _eventosCount = '12';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 720;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildGreeting(context),
              const SizedBox(height: 28),
              _buildStatCards(context, isWide: isWide),
              const SizedBox(height: 28),
              _buildSections(context, isWide: isWide),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGreeting(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¡Hola!',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Bienvenido a la plataforma CIEE',
          style: textTheme.bodyLarge?.copyWith(color: colors.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildStatCards(BuildContext context, {required bool isWide}) {
    final colors = Theme.of(context).colorScheme;

    final cards = [
      StatCard(
        icon: Icons.verified_user_outlined,
        label: 'Permisos dados al personal',
        value: _permisosCount,
        color: colors.primary,
      ),
      StatCard(
        icon: Icons.warning_amber_outlined,
        label: 'Incidencias',
        value: _incidenciasCount,
        color: colors.error,
      ),
      StatCard(
        icon: Icons.event_outlined,
        label: 'Eventos próximos',
        value: _eventosCount,
        color: colors.tertiary,
      ),
    ];

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(width: 16),
            Expanded(child: cards[i]),
          ],
        ],
      );
    }

    return Column(
      children: [
        for (var i = 0; i < cards.length; i++) ...[
          if (i > 0) const SizedBox(height: 16),
          cards[i],
        ],
      ],
    );
  }

  Widget _buildSections(BuildContext context, {required bool isWide}) {
    final seguimiento = _buildSeguimientoSection(context);
    final eventos = _buildEventosSection(context);

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: seguimiento),
          const SizedBox(width: 16),
          Expanded(child: eventos),
        ],
      );
    }

    return Column(children: [seguimiento, const SizedBox(height: 16), eventos]);
  }

  Widget _buildSeguimientoSection(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SectionCard(
      title: 'Seguimiento de incidentes',
      icon: Icons.warning_amber_outlined,
      trailing: TextButton(onPressed: () {}, child: const Text('Ver todos')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IncidentListItem(
            title: 'Daño al mobiliario del aula 12B',
            subtitle: '8 mesas y 12 sillas ingresadas con reporte de desgaste.',
            date: 'Hoy, 09:30',
            severityLabel: 'Alta',
            severityColor: colors.error,
          ),
          _buildItemDivider(colors),
          IncidentListItem(
            title: 'Alumno con retraso crónico',
            subtitle: '3° de primaria, grupo B. Reincidencia semanal.',
            date: 'Ayer, 14:10',
            severityLabel: 'Media',
            severityColor: Colors.orange.shade800,
          ),
          _buildItemDivider(colors),
          IncidentListItem(
            title: 'Acceso no autorizado a la bodega',
            subtitle: 'Cámara detectó ingreso sin credencial.',
            date: 'Mar 02, 11:05',
            severityLabel: 'Baja',
            severityColor: Colors.green.shade700,
          ),
        ],
      ),
    );
  }

  Widget _buildEventosSection(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SectionCard(
      title: 'Próximos eventos',
      icon: Icons.event_outlined,
      trailing: TextButton(onPressed: () {}, child: const Text('Ver todos')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const EventListItem(
            day: '12',
            month: 'SEP',
            title: 'Entrega de boletas',
            subtitle: '09:00 · Auditorio principal',
          ),
          _buildItemDivider(colors),
          const EventListItem(
            day: '18',
            month: 'SEP',
            title: 'Junta de consejo técnico',
            subtitle: '14:00 · Sala de juntas',
          ),
          _buildItemDivider(colors),
          const EventListItem(
            day: '24',
            month: 'SEP',
            title: 'Simulacro de evacuación',
            subtitle: '11:00 · Cancha escolar',
          ),
        ],
      ),
    );
  }

  Widget _buildItemDivider(ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Divider(height: 1, color: colors.outlineVariant),
    );
  }
}
