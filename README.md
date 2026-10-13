# 🛰️ DronePano Studio - Visor y Gestor 360° de Dron RTK

Aplicación web interactiva para gestionar, geoposicionar y explorar fotografías panorámicas 360° tomadas desde drones (con metadatos RTK de alta precisión).

## 🚀 Características
- **Gestor de Proyectos (Dashboard):** Vista principal para administrar múltiples levantamientos aéreos y crear nuevos proyectos.
- **Creación de Proyectos en el Navegador:** Arrastra y suelta tus fotografías panorámicas 360° (JPG); la aplicación lee automáticamente las coordenadas GPS y altitud RTK mediante `exifr` y permite nombrar el proyecto y personalizar cada toma.
- **Exportador Individual (Compartir Proyecto):** Genera y descarga un archivo `.zip` autónomo y listo para usar con el proyecto seleccionado, sin revelar ni incluir los demás proyectos.
- **Vista 360° Fluida (WebGL / Pannellum):** Soporte de gran angular 0.5x (125° HFOV), zoom normal 1.0x y giro automático.
- **Menú de Opciones Compacto (☰):** Menú desplegable vertical hacia abajo que mantiene la brújula central y la rosa de los vientos totalmente despejadas.
- **Burbujas Flotantes 3D Interactivas:** Cada punto de toma muestra una esfera miniatura con previsualización, número y distancia métrica geodésica.
- **Filtro de Burbujas:** Alterna al instante entre ver todas las tomas o solo las cercanas.
- **Vista Aérea Satelital (Leaflet + Esri World Imagery):** Minimapa con pines georreferenciados, ruta de vuelo y cono de radar dinámico en tiempo real sincronizado con el giro de la cámara.
- **Modo Dividido (Split-View):** Visualización lado a lado 50% mapa / 50% visor 360°.

## 💻 Uso Local
1. Haz doble clic en `Iniciar_Visor_360.bat`.
2. Se iniciará el servidor local y abrirá la plataforma en tu navegador.

## 🌐 Publicación en GitHub Pages
1. Ve a **Settings** > **Pages** en tu repositorio de GitHub.
2. En **Branch**, selecciona `main` y la carpeta `/ (root)`.
3. Tu visor estará disponible públicamente en internet a través de GitHub Pages.
