# Guía de Publicación en pub.dev

## Pasos para Publicar

### 1. Verificaciones Previas

Ejecuta estos comandos para verificar que todo está correcto:

```bash
# Obtener dependencias
flutter pub get

# Analizar el código
flutter analyze

# Ejecutar tests
flutter test

# Verificar el formato del código
dart format --set-exit-if-changed .

# Dry run de la publicación (simulación)
dart pub publish --dry-run
```

### 2. Configurar Git y GitHub

Si aún no has configurado el repositorio:

```bash
# Inicializar git (si no está inicializado)
git init

# Agregar todos los archivos
git add .

# Hacer el primer commit
git commit -m "feat: Initial release v1.0.0"

# Crear repositorio en GitHub y conectar
git remote add origin https://github.com/cristiancamilo070/App-Shimmer.git
git branch -M main
git push -u origin main

# Crear tag para la versión
git tag v1.0.0
git push origin v1.0.0
```

### 3. Actualizar pubspec.yaml

Asegúrate de que estos campos estén correctos en `pubspec.yaml`:

```yaml
homepage: https://github.com/cristiancamilo070/App-Shimmerapp_shimmer
repository: https://github.com/cristiancamilo070/App-Shimmer
issue_tracker: https://github.com/cristiancamilo070/App-Shimmer/issues
```

### 4. Publicar en pub.dev

```bash
# Publicar el paquete
dart pub publish
```

Sigue las instrucciones en la terminal para:
1. Revisar el resumen del paquete
2. Confirmar la publicación (escribe 'yes')
3. Autenticarte con tu cuenta de Google si es necesario

### 5. Después de Publicar

1. Verifica que el paquete aparezca en https://pub.dev/packages/app_shimmer
2. Espera unos minutos para que se genere el puntaje de calidad
3. Revisa la documentación generada automáticamente
4. Comparte el link con la comunidad

## Checklist Pre-Publicación

- [x] README.md completo con ejemplos
- [x] CHANGELOG.md actualizado
- [x] LICENSE file (MIT)
- [x] Documentación en el código (dartdoc)
- [x] Tests implementados
- [x] analysis_options.yaml configurado
- [x] Sin warnings en `flutter analyze`
- [x] Tests pasan con `flutter test`
- [x] Versión semántica correcta (1.0.0)
- [x] Example folder funcional
- [x] pubspec.yaml con todos los campos necesarios

## Actualizar Versiones Futuras

Para publicar actualizaciones:

1. Actualiza el número de versión en `pubspec.yaml` siguiendo [Semantic Versioning](https://semver.org/):
   - **MAJOR** (1.x.x): Cambios que rompen compatibilidad
   - **MINOR** (x.1.x): Nueva funcionalidad compatible
   - **PATCH** (x.x.1): Correcciones de bugs

2. Actualiza `CHANGELOG.md` con los cambios

3. Commit y tag:
   ```bash
   git add .
   git commit -m "chore: bump version to x.x.x"
   git tag vx.x.x
   git push origin main
   git push origin vx.x.x
   ```

4. Publica:
   ```bash
   dart pub publish
   ```

## Puntuación de Calidad

pub.dev califica los paquetes con hasta 130 puntos en:

- **Conventions** (30 pts): Sigue las convenciones de Dart/Flutter
- **Documentation** (30 pts): Comentarios y ejemplos
- **Platforms** (20 pts): Soporte multiplataforma
- **Analysis** (50 pts): Pasa análisis estático sin errores

Tu paquete está configurado para obtener la máxima puntuación 🎯

## Comandos Útiles

```bash
# Ver la versión actual
dart pub deps

# Ver información del paquete
dart pub outdated

# Actualizar dependencias
flutter pub upgrade

# Limpiar caché
flutter clean
```

## Problemas Comunes

### Error: "Package validation found the following issues"
- Ejecuta `dart pub publish --dry-run` para ver detalles
- Verifica que todos los archivos requeridos estén presentes

### Error: "The name already exists"
- El nombre del paquete ya está en uso
- Cambia el `name` en `pubspec.yaml`

### Warnings de análisis
- Ejecuta `flutter analyze` y corrige todos los warnings
- Asegúrate de que `analysis_options.yaml` esté configurado

## Recursos

- [Documentación oficial de publicación](https://dart.dev/tools/pub/publishing)
- [Mejores prácticas para paquetes](https://dart.dev/guides/libraries/create-packages)
- [Versionado Semántico](https://semver.org/)

## Soporte

Si encuentras problemas durante la publicación:
1. Revisa los logs de error
2. Consulta la documentación oficial
3. Busca en [StackOverflow](https://stackoverflow.com/questions/tagged/dart-pub)
