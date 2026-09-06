import 'package:flutter/material.dart';

import '../../widgets/app_tabs.dart';
import 'gestion_incidencias/gestion_incidencias.dart';
import 'seguimiento_incidencias/seguimiento_incidencias.dart';
import 'tipos_incidencias/tipos_incidencias.dart';

class IncidentsScreen extends StatelessWidget {
  const IncidentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: AppTabs(
        tabs: const [
          'Gestión de incidencias',
          'Seguimiento de incidencias',
          'Tipos de incidencias',
        ],
        children: const [
          GestionIncidencias(),
          SeguimientoIncidencias(),
          TiposIncidencias(),
        ],
      ),
    );
  }
}