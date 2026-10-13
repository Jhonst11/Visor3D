# 🛰️ Visor 360° de Panorámicas de Dron RTK

Aplicación web interactiva para visualizar y geoposicionar fotografías panorámicas 360° tomadas desde drones (con metadatos RTK).

## 🚀 Características
- **Vista 360° Fluida (WebGL / Pannellum)** con soporte de campo visual gran angular 0.5x (125° HFOV) y zoom extendido.
- **Burbujas Flotantes 3D Interactivas:** Cada punto de toma muestra una vista previa esférica en miniatura con el número y la distancia en metros, calculados automáticamente mediante fórmulas geodésicas (Haversine y Rumbo Azimutal).
- **Filtro Rápido:** Alterna entre ver todas las tomas del proyecto o únicamente las cercanas (< 130 m).
- **Mapa Satelital en Tiempo Real (Leaflet + Esri World Imagery):** Incluye pines georreferenciados, línea de trayectoria de vuelo y un radar / cono de visión dinámico que rota en vivo según hacia dónde mire la cámara 360°.
- **Telemetría RTK en Vivo:** Altitud MSL, altitud relativa de vuelo, latitud, longitud y rumbo cardinal.
- **Acceso Rápido:** Carrusel inferior interactivo y controles de pantalla completa y división de vista (50% mapa / 50% visor 360°).

## 💻 Uso Local
1. Haz doble clic en `Iniciar_Visor_360.bat`.
2. Se abrirá automáticamente en tu navegador web en `http://localhost:8080/`.

## 🌐 Publicación en GitHub Pages
1. Ve a **Settings** > **Pages** en tu repositorio de GitHub.
2. En **Branch**, selecciona `main` y guarda (`/root`).
3. En unos segundos tu visor 360° estará disponible públicamente en internet.
