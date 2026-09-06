import 'package:flutter/material.dart';

import '../../../widgets/app_table.dart';

class TiposIncidencias extends StatelessWidget {
  const TiposIncidencias({super.key});

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
              label: const Text('Nuevo Tipo'),
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
              'Nombre',
              'Descripción',
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
        nombre: 'Daño a propiedad',
        descripcion: 'Daños o deterioro del mobiliario, infraestructura o equipamiento escolar.',
      ),
      (
        nombre: 'Retraso',
        descripcion: 'Llegadas tardías recurrentes de estudiantes a clases.',
      ),
      (
        nombre: 'Seguridad',
        descripcion: 'Accesos no autorizados, vandalismo o riesgos al interior del plantel.',
      ),
      (
        nombre: 'Académico',
        descripcion: 'Incumplimiento de actividades, calificaciones o ausentismo escolar.',
      ),
      (
        nombre: 'Conducta',
        descripcion: 'Comportamientos que alteran la convivencia escolar, como peleas o ruido.',
      ),
      (
        nombre: 'Equipamiento',
        descripcion: 'Falta, extravío o mal estado de equipo o material didáctico.',
      ),
      (
        nombre: 'Salud',
        descripcion: 'Emergencias médicas, accidentes o condiciones de salud de estudiantes.',
      ),
      (
        nombre: 'Alimentación',
        descripcion: 'Irregularidades en el servicio de alimentos o comedor escolar.',
      ),
      (
        nombre: 'Transporte',
        descripcion: 'Incidentes relacionados con el traslado de estudiantes.',
      ),
      (
        nombre: 'Infraestructura',
        descripcion: 'Fallas estructurales, de instalaciones o servicios básicos.',
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
    ({String nombre, String descripcion}) row,
  ) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (:nombre, :descripcion) = row;

    return [
      Text(
        '$index',
        style: textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
      ),
      Text(
        nombre,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: colors.onSurface,
        ),
      ),
      SizedBox(
        width: 380,
        child: Text(
          descripcion,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
        ),
      ),
      _buildAcciones(colors),
    ];
  }

  Widget _buildAcciones(ColorScheme colors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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