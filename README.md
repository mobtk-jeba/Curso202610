# Curso de Desarrollo iOS Básico

Proyecto que construimos juntos durante el curso: 25 horas en 5 días de 5 horas.
App en UIKit con Storyboards y Swift; el último día se integra SwiftUI.

## Requisitos

- Mac con macOS compatible con Xcode 16 o superior
- Xcode instalado desde la Mac App Store (la descarga tarda: instálalo antes del día 1)
- Una Apple ID (para firmar y correr en tu iPhone)
- Git (viene con Xcode)

## Cómo obtener el proyecto

```bash
git clone https://github.com/mobtk-jeba/Curso202610.git
cd curso-ios-cognitus-2026
open *.xcodeproj
```

La primera vez, Xcode descarga los paquetes (Alamofire, SDWebImage, SVProgressHUD). Si falla:
File → Packages → Reset Package Caches.

## Puntos de guardado (tags)

Al final de cada bloque se crea un tag. Si te atrasas o algo se rompe, salta al último:

```bash
git fetch --tags
git switch -c mi-trabajo d2-fin    # crea tu rama a partir del punto de guardado
```

¿No usas git? En GitHub → Tags, cada tag tiene un botón para descargar el ZIP.

| Tag | Contenido |
| --- | --- |
| `d1-inicio` | Proyecto vacío con assets, colores y paquetes SPM |
| `d1-fin` | Primer proyecto corriendo en simulador, breakpoint y configuración |
| `d2-fin` | Modelo `Noticia` (Codable), extensiones, enums, `BaseVC` y primer test |
| `d3-fin` | LaunchScreen, Navigation Controller, Login, Registro y Recuperar contraseña |
| `d4-fin` | Menú, Noticias, Detalle con WebKit, Perfil, Check-in con mapa y Tareas |
| `d5-fin` | Red real, paso de datos entre pantallas y Notificaciones en SwiftUI |

## Temario

1. **Desarrollo iOS**: modelo MVC, overview de Swift
2. **Ambiente de desarrollo**: Xcode, Organizer, Interface Builder, compilación y debug, archivos de configuración
3. **Conceptos básicos**: estructuras, clases, enumeraciones, extensiones
4. **Ciclo de vida**: aplicación y vistas
5. **Principales APIs y frameworks**
6. **Storyboards**: imágenes y resoluciones, LaunchScreen, layouts, constraints, Navigation Controller
7. **Controles básicos**: View, ScrollView, Label, TextField, TextView, Button, ImageView, PickerView, TableView, CollectionView, WebKit
8. **Controles e instancias**
9. **Conceptos de SwiftUI**

## Atajos de Xcode

| Atajo | Acción |
| --- | --- |
| ⌘B | Compilar |
| ⌘R | Correr |
| ⌘. | Detener |
| ⌘U | Correr pruebas |
| ⌘⇧K | Limpiar build |
| ⌘⇧O | Abrir archivo rápido |
| ⌘⇧L | Biblioteca de objetos |
| ⌃⌥⌘↩ | Editor Assistant |
| ⌃I | Indentar |
| ⌘/ | Comentar |

## Material de apoyo

Diagramas en la carpeta `Material/`.
