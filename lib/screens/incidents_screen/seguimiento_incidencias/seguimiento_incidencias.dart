import 'package:flutter/material.dart';

import '../../../widgets/app_table.dart';

class SeguimientoIncidencias extends StatelessWidget {
  const SeguimientoIncidencias({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 20),
              label: const Text('Nuevo Seguimiento'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          AppTable(
            columns: const [
              '#',
              'Incidente',
              'Fecha del seguimiento',
              'Descripción',
              'Estatus',
              'Personal',
              'Acciones',
            ],
            rows: _buildRows(context),
            rowsPerPage: 8,
          ),
        ],
      ),
    );
  }

  List<List<Widget>> _buildRows(BuildContext context) {
    const data = [
      (
        incidente: 'Daño al mobiliario del aula 12B',
        fecha: '05/09/2026',
        descripcion: 'Se coordinó la reparación con mantenimiento.',
        abierta: true,
        personal: 'Aurelio Méndez',
      ),
      (
        incidente: 'Alumno con retraso crónico',
        fecha: '04/09/2026',
        descripcion: 'Se citó a los padres de familia para dialogar.',
        abierta: true,
        personal: 'María Ibarra',
      ),
      (
        incidente: 'Acceso no autorizado a la bodega',
        fecha: '04/09/2026',
        descripcion: 'Se reforzó el cerrojo y se actualizó el acceso.',
        abierta: false,
        personal: 'Seg. Juárez',
      ),
      (
        incidente: 'Incumplimiento de tareas',
        fecha: '03/09/2026',
        descripcion: 'Se asignó plan de regularización al alumno.',
        abierta: true,
        personal: 'Pedro Casas',
      ),
      (
        incidente: 'Pelea en el receso',
        fecha: '02/09/2026',
        descripcion: 'Se aplicó medida disciplinaria y se avisó a tutores.',
        abierta: false,
        personal: 'Ana Beltrán',
      ),
      (
        incidente: 'Grafiti en sanitarios',
        fecha: '01/09/2026',
        descripcion: 'Se programó la limpieza y retiro de marcas.',
        abierta: true,
        personal: 'Conserje Rojas',
      ),
      (
        incidente: 'Falta de equipo de laboratorio',
        fecha: '01/09/2026',
        descripcion: 'Se levantó inventario para rastrear el material.',
        abierta: true,
        personal: 'Celia Duarte',
      ),
      (
        incidente: 'Intento de vandalismo',
        fecha: '29/08/2026',
        descripcion: 'Se presentó reporte a seguridad del sector.',
        abierta: false,
        personal: 'Conserje Rojas',
      ),
      (
        incidente: 'Ausentismo prolongado',
        fecha: '28/08/2026',
        descripcion: 'Trabajo social inicia seguimiento con la familia.',
        abierta: true,
        personal: 'María Ibarra',
      ),
      (
        incidente: 'Ruido excesivo en biblioteca',
        fecha: '27/08/2026',
        descripcion: 'Se acordaron horarios rotativos de lectura.',
        abierta: false,
        personal: 'Ana Beltrán',
      ),
    ];

    return [
      for (var i = 0; i < data.length; i++)
        _buildRow(context, i + 1, data[i]),
    ];
  }

  List<Widget> _buildRow(
    BuildContext context,
    int index,
    ({
      String incidente,
      String fecha,
      String descripcion,
      bool abierta,
      String personal,
    })
    row,
  ) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (
      :incidente,
      :fecha,
      :descripcion,
      :abierta,
      :personal,
    ) = row;

    return [
      Text(
        '$index',
        style: textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
      ),
      Text(
        incidente,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: colors.onSurface,
        ),
      ),
      Text(fecha, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      SizedBox(
        width: 260,
        child: Text(
          descripcion,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
        ),
      ),
      _buildEstatusChip(colors, textTheme, abierta),
      Text(personal, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      _buildAcciones(colors),
    ];
  }

  Widget _buildEstatusChip(
    ColorScheme colors,
    TextTheme textTheme,
    bool abierta,
  ) {
    final color = abierta ? Colors.green.shade700 : colors.outline;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        abierta ? 'Abierta' : 'Cerrada',
        style: textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildAcciones(ColorScheme colors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.visibility_outlined, size: 20),
          tooltip: 'Ver',
          color: colors.primary,
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit_outlined, size: 20),
          tooltip: 'Editar',
          color: colors.tertiary,
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete_outline, size: 20),
          tooltip: 'Eliminar',
          color: colors.error,
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}