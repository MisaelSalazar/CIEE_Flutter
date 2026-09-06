import 'package:flutter/material.dart';

import '../../../widgets/app_table.dart';

class GestionIncidencias extends StatelessWidget {
  const GestionIncidencias({super.key});

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
              label: const Text('Agregar Incidencia'),
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
              'Escuela',
              'Estudiante',
              'Personal',
              'Tipo de incidente',
              'Fecha del incidente',
              'Descripción',
              'Estado',
              'Usuario',
              'Fecha de creación',
              'Última actualización',
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
        escuela: 'Primaria Benito Juárez',
        estudiante: 'Luisa Hernández',
        personal: 'Aurelio Méndez',
        tipo: 'Daño a propiedad',
        fecha: '05/09/2026',
        descripcion: '8 mesas y 12 sillas ingresadas con reporte de desgaste.',
        abierto: true,
        usuario: 'dir.ramírez',
        creada: '05/09/2026',
        actualizada: '05/09/2026',
      ),
      (
        incidente: 'Alumno con retraso crónico',
        escuela: 'Primaria Benito Juárez',
        estudiante: 'Emilio Torres',
        personal: 'María Ibarra',
        tipo: 'Retraso',
        fecha: '04/09/2026',
        descripcion: '3° de primaria, grupo B. Reincidencia semanal.',
        abierto: true,
        usuario: 'prof.ibarra',
        creada: '04/09/2026',
        actualizada: '05/09/2026',
      ),
      (
        incidente: 'Acceso no autorizado a la bodega',
        escuela: 'Secundaria Técnica 14',
        estudiante: '—',
        personal: 'Seg. Juárez',
        tipo: 'Seguridad',
        fecha: '04/09/2026',
        descripcion: 'Cámara detectó ingreso sin credencial.',
        abierto: false,
        usuario: 'coord.seguridad',
        creada: '04/09/2026',
        actualizada: '04/09/2026',
      ),
      (
        incidente: 'Incumplimiento de tareas',
        escuela: 'Primaria Benito Juárez',
        estudiante: 'Valeria Soto',
        personal: 'Pedro Casas',
        tipo: 'Académico',
        fecha: '03/09/2026',
        descripcion: 'Falta de entrega de actividades por dos semanas.',
        abierto: true,
        usuario: 'prof.casas',
        creada: '03/09/2026',
        actualizada: '05/09/2026',
      ),
      (
        incidente: 'Pelea en el receso',
        escuela: 'Secundaria Técnica 14',
        estudiante: 'Ricardo Luna',
        personal: 'Ana Beltrán',
        tipo: 'Conducta',
        fecha: '02/09/2026',
        descripcion: 'Conflicto físico entre alumnos en la cancha.',
        abierto: false,
        usuario: 'prefect.beltrán',
        creada: '02/09/2026',
        actualizada: '03/09/2026',
      ),
      (
        incidente: 'Grafiti en sanitarios',
        escuela: 'Primaria Benito Juárez',
        estudiante: 'No identificado',
        personal: 'Conserje Rojas',
        tipo: 'Daño a propiedad',
        fecha: '01/09/2026',
        descripcion: 'Marcas en paredes del baño de varones.',
        abierto: true,
        usuario: 'coord.rojas',
        creada: '01/09/2026',
        actualizada: '05/09/2026',
      ),
      (
        incidente: 'Falta de equipo de laboratorio',
        escuela: 'Secundaria Técnica 14',
        estudiante: '—',
        personal: 'Celia Duarte',
        tipo: 'Equipamiento',
        fecha: '01/09/2026',
        descripcion: 'Material de biología reportado como extraviado.',
        abierto: true,
        usuario: 'prof.duarte',
        creada: '01/09/2026',
        actualizada: '04/09/2026',
      ),
      (
        incidente: 'Intento de vandalismo',
        escuela: 'Primaria Benito Juárez',
        estudiante: 'No aplica',
        personal: 'Conserje Rojas',
        tipo: 'Seguridad',
        fecha: '29/08/2026',
        descripcion: 'Persona ajena intentó forzar la entrada trasera.',
        abierto: false,
        usuario: 'coord.rojas',
        creada: '29/08/2026',
        actualizada: '30/08/2026',
      ),
      (
        incidente: 'Ausentismo prolongado',
        escuela: 'Primaria Benito Juárez',
        estudiante: 'Sofía Chávez',
        personal: 'María Ibarra',
        tipo: 'Académico',
        fecha: '28/08/2026',
        descripcion: 'Alumna ausente más de 5 días sin justificación.',
        abierto: true,
        usuario: 'prof.ibarra',
        creada: '28/08/2026',
        actualizada: '03/09/2026',
      ),
      (
        incidente: 'Ruido excesivo en biblioteca',
        escuela: 'Secundaria Técnica 14',
        estudiante: 'Grupo 2°A',
        personal: 'Ana Beltrán',
        tipo: 'Conducta',
        fecha: '27/08/2026',
        descripcion: 'Interrupciones constantes durante la hora de lectura.',
        abierto: false,
        usuario: 'biblio.salas',
        creada: '27/08/2026',
        actualizada: '28/08/2026',
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
      String escuela,
      String estudiante,
      String personal,
      String tipo,
      String fecha,
      String descripcion,
      bool abierto,
      String usuario,
      String creada,
      String actualizada,
    })
    row,
  ) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (
      :incidente,
      :escuela,
      :estudiante,
      :personal,
      :tipo,
      :fecha,
      :descripcion,
      :abierto,
      :usuario,
      :creada,
      :actualizada,
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
      Text(escuela, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      Text(estudiante, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      Text(personal, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      Text(tipo, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      Text(fecha, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      SizedBox(
        width: 200,
        child: Text(
          descripcion,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
        ),
      ),
      _buildEstadoChip(colors, textTheme, abierto),
      Text(usuario, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      Text(creada, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      Text(actualizada, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface)),
      _buildAcciones(colors),
    ];
  }

  Widget _buildEstadoChip(
    ColorScheme colors,
    TextTheme textTheme,
    bool abierto,
  ) {
    final color = abierto ? Colors.green.shade700 : colors.outline;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        abierto ? 'Abierto' : 'Cerrado',
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