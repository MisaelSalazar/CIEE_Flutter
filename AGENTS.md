# Reglas del Proyecto CIEE

## Descripción del Proyecto
**CIEE** = Control de Incidencias y Eventos Escolares
Aplicación monolítica Flutter para gestionar incidencias y eventos en escuelas públicas.

## Rol del Asistente
- **Maquetar interfaces gráficas y componentes** únicamente
- **No agregar lógica de negocio** a menos que se solicite explícitamente

## Reglas de Widgets
1. **Verificar widgets existentes** antes de maquetar una screen
2. **Pedir autorización** si se necesitan crear widgets nuevos
3. Los widgets deben ser **genéricos y reutilizables**

## Estructura de Archivos
- La lógica de negocio debe estar **separada del diseño**
- Las funciones deben vivir dentro de su **propio archivo `.dart`**
- Ese archivo debe vivir dentro de su **propio directorio** dentro de `/screens/`
- Ejemplo: `login_screen.dart` → `/screens/login_screen/login_screen.dart`

## Restricciones
- **NO tocar nada relacionado con git o github**
- **Pedir autorización** antes de realizar cualquier actividad
- **Limitarse a seguir las instrucciones** del usuario
