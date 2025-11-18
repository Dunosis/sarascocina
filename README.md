# Sara's Cocina - Website

Sitio web estático para el restaurante mexicano Sara's Cocina ubicado en Humboldt Park, Chicago.

## 📋 Tabla de Contenidos

- [Requisitos](#requisitos)
- [Configuración Inicial](#configuración-inicial)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Configuración de Mapbox](#configuración-de-mapbox)
- [Desarrollo Local](#desarrollo-local)
- [Despliegue](#despliegue)
- [Personalización](#personalización)
- [Troubleshooting](#troubleshooting)

## 🔧 Requisitos

No se requieren dependencias de Node.js o gestores de paquetes. El proyecto es un sitio web estático que utiliza:

- **Navegador web moderno** (Chrome, Firefox, Safari, Edge)
- **Servidor HTTP local** (opcional, para desarrollo)
- **Git** (para control de versiones y despliegue)
- **Cuenta de Mapbox** (para el mapa interactivo)

## 🚀 Configuración Inicial

### 1. Clonar el Repositorio

```bash
git clone <repository-url>
cd sarascocina
```

### 2. Configurar Mapbox

El proyecto utiliza Mapbox GL JS para mostrar el mapa interactivo. Necesitas configurar tu token de acceso:

1. Crea una cuenta en [Mapbox](https://www.mapbox.com/)
2. Obtén tu token de acceso público desde el [Mapbox Account Page](https://account.mapbox.com/access-tokens/)
3. Edita el archivo `map.js` y reemplaza el token en la línea 1-2:

```javascript
mapboxgl.accessToken = "TU_TOKEN_DE_MAPBOX_AQUI";
```

**⚠️ Importante:** El token actual en el código es funcional, pero para producción se recomienda usar tu propio token.

### 3. Verificar Archivos

Asegúrate de que todos los archivos estén presentes:

- `index.html` - Página principal
- `map.js` - Configuración del mapa
- `css/animations.css` - Animaciones CSS
- `img/` - Carpeta con todas las imágenes
- `menu.pdf` - Menú del restaurante

## 📁 Estructura del Proyecto

```
sarascocina/
├── index.html              # Página principal
├── map.js                  # Configuración del mapa interactivo
├── menu.pdf                # Menú del restaurante (descargable)
├── deploy.sh               # Script de despliegue a GitHub Pages
├── CNAME                   # Configuración de dominio personalizado
├── css/
│   └── animations.css      # Animaciones CSS personalizadas
└── img/                    # Imágenes del sitio
    ├── sc-logo.jpg
    ├── sc-header-bg.png
    ├── sc-bricks-bg.png
    └── ... (más imágenes)
```

## 🛠 Tecnologías Utilizadas

- **HTML5** - Estructura del sitio
- **Tailwind CSS** (vía CDN) - Framework de utilidades CSS
- **Mapbox GL JS v3.2.0** - Mapas interactivos
- **Google Fonts** - Tipografías (Manrope, Inter)
- **Plausible Analytics** - Analytics (opcional, configurado para sarascocina.com)
- **CSS3** - Animaciones personalizadas

## 🗺 Configuración de Mapbox

### Coordenadas del Restaurante

Las coordenadas del restaurante están configuradas en `map.js`:

```javascript
const markerCoordinates = [-87.69539502540738, 41.90259597685963]; // [longitud, latitud]
```

Para cambiar la ubicación del marcador, edita estas coordenadas en `map.js`.

### Estilo del Mapa

El estilo del mapa se configura en `map.js`:

```javascript
style: "mapbox://styles/mapbox/streets-v12"
```

Puedes cambiar el estilo del mapa usando otros estilos de Mapbox o creando uno personalizado.

## 💻 Desarrollo Local

### Opción 1: Servidor HTTP Simple (Python)

```bash
# Python 3
python3 -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

Luego abre `http://localhost:8000` en tu navegador.

### Opción 2: Servidor HTTP Simple (Node.js)

```bash
npx http-server -p 8000
```

### Opción 3: Live Server (VS Code)

Si usas VS Code, instala la extensión "Live Server" y haz clic derecho en `index.html` > "Open with Live Server".

### Opción 4: Servidor PHP

```bash
php -S localhost:8000
```

## 🚀 Despliegue

### Despliegue a GitHub Pages

El proyecto incluye un script de despliegue automatizado:

```bash
chmod +x deploy.sh
./deploy.sh
```

El script:
1. Verifica que estés en el directorio correcto
2. Crea o cambia a la rama `gh-pages`
3. Copia los archivos necesarios
4. Hace commit y push a GitHub Pages
5. Regresa a la rama `main`

### Despliegue Manual

1. Crea una rama `gh-pages`:
```bash
git checkout -b gh-pages
```

2. Copia los archivos necesarios:
```bash
git checkout main -- index.html css/ img/ map.js menu.pdf CNAME
```

3. Haz commit y push:
```bash
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages
```

### Configuración de Dominio Personalizado

El archivo `CNAME` contiene la configuración del dominio personalizado (`www.sarascocina.com`). Para usar un dominio diferente:

1. Edita el archivo `CNAME` con tu dominio
2. Configura los registros DNS en tu proveedor de dominio apuntando a GitHub Pages

## 🎨 Personalización

### Cambiar Colores

Los colores principales están definidos en las clases de Tailwind en `index.html`:

- **Amarillo de fondo:** `bg-[#fcaf3c]`
- **Rojo principal:** `bg-[#FE0000]` o `text-[#FE0000]`
- **Verde botones:** `bg-[#40a629]`

### Cambiar Fuentes

Las fuentes se cargan desde Google Fonts en el `<head>`:

```html
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@800&family=Inter:wght@300;400&display=swap" rel="stylesheet">
```

### Modificar Animaciones

Las animaciones están definidas en `css/animations.css`. Puedes:

- Ajustar la duración de las animaciones
- Modificar los efectos de entrada
- Cambiar los keyframes

### Actualizar Información del Restaurante

Edita `index.html` para cambiar:

- **Dirección:** Busca las etiquetas `<address>`
- **Teléfono:** Busca `tel:+17732929000` y actualiza el número
- **Email:** Busca `sarascocina@gmail.com`
- **Coordenadas del mapa:** Edita `map.js`

### Agregar o Modificar Productos

Los productos se muestran en la sección "Our Other Dishes". Para agregar uno nuevo:

1. Agrega la imagen en `img/`
2. Copia una de las tarjetas de producto en `index.html`
3. Actualiza la ruta de la imagen y el texto del botón

## 🔍 Troubleshooting

### El mapa no se muestra

1. Verifica que el token de Mapbox sea válido
2. Revisa la consola del navegador para errores
3. Asegúrate de que Mapbox GL JS se cargue correctamente

### Las animaciones no funcionan

1. Verifica que `css/animations.css` esté cargado
2. Las animaciones solo funcionan en pantallas de 768px o más (media query)
3. Revisa la consola del navegador para errores CSS

### Las imágenes no se cargan

1. Verifica las rutas de las imágenes (deben ser relativas: `./img/` o `/img/`)
2. Asegúrate de que los archivos existan en la carpeta `img/`
3. Verifica los permisos de los archivos

### El botón de centrar mapa no funciona

1. Verifica que el ID del botón sea `centerMapBtn`
2. Asegúrate de que `map.js` se cargue después del HTML
3. Revisa la consola del navegador para errores JavaScript

### Problemas con GitHub Pages

1. Verifica que la rama `gh-pages` exista
2. Asegúrate de que GitHub Pages esté habilitado en la configuración del repositorio
3. Verifica que el archivo `CNAME` esté presente si usas dominio personalizado

## 📝 Notas Adicionales

- **Analytics:** El sitio utiliza Plausible Analytics configurado para `sarascocina.com`. Si necesitas cambiar el dominio, edita la línea 37 en `index.html`.
- **SEO:** El sitio incluye meta tags para SEO, Open Graph y Twitter Cards.
- **Responsive:** El sitio es completamente responsive y se adapta a dispositivos móviles y desktop.
- **Performance:** Las imágenes usan `loading="lazy"` para carga diferida.

## 👥 Contribución

Para contribuir al proyecto:

1. Crea una rama nueva desde `main`
2. Realiza tus cambios
3. Prueba localmente
4. Crea un Pull Request

## 📄 Licencia

Este proyecto es propiedad de Sara's Cocina y fue desarrollado por [Dunosis](https://dunosis.com).

## 📞 Soporte

Para preguntas o problemas, contacta al equipo de desarrollo en [Dunosis](https://dunosis.com).

---

**Desarrollado por [Dunosis](https://dunosis.com)**

