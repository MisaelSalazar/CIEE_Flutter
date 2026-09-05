import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/brand_header.dart';
import '../../widgets/form_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surfaceContainerLowest,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: FormCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BrandHeader(
                  title: 'CIEE',
                  subtitle: 'Control de Incidencias y Eventos Escolares',
                ),
                const SizedBox(height: 32),
                const AppTextField(
                  label: 'Usuario',
                  placeholder: 'Ingresa tu usuario',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),
                const AppTextField(
                  label: 'Contraseña',
                  placeholder: 'Ingresa tu contraseña',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  showToggle: true,
                ),
                const SizedBox(height: 28),
                AppButton(
                  label: 'Ingresar',
                  icon: Icons.login,
                  onPressed: () => context.go('/home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
