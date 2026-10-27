<p align="center">
  <img src="assets/logo.png" width="128" alt="ClipStack logo">
</p>

<h1 align="center">ClipStack</h1>

<p align="center">[English](README.md) · **Español**</p>

Gestor de portapapeles **gratis y open source** para macOS.
ClipStack guarda todo lo que copias (texto, imágenes, archivos y capturas de pantalla)
y te deja pegar cualquier elemento anterior con un atajo de teclado.

## ⬇️ Descargar

**Con Homebrew** (recomendado):

```bash
brew install --cask zh0du/tap/clipstack
```

**O a mano:** **[descarga ClipStack.dmg](https://github.com/Zh0du/clipstack/releases/latest/download/ClipStack.dmg)**. No necesitas compilar nada.

1. Abre `ClipStack.dmg` y arrastra **ClipStack** a **Aplicaciones**.
2. Abre ClipStack desde Aplicaciones. Aparecerá un icono 📋 en la barra de menús.
3. La primera vez, macOS puede decir que la app "no se puede abrir" porque no está firmada
   con un certificado de pago de Apple Developer. Ve a **Ajustes del Sistema → Privacidad y seguridad**,
   baja hasta el final y pulsa **Abrir igualmente**.
   O ejecuta esto en Terminal:
   ```bash
   xattr -dr com.apple.quarantine /Applications/ClipStack.app
   ```
4. Da el permiso de **Accesibilidad** cuando te lo pida (ver [Permisos](#permisos)).

Todas las versiones están en la página de [Releases](https://github.com/Zh0du/clipstack/releases).

## Funciones

- 📋 Historial de todo lo que copias: texto, imágenes y archivos.
- 📸 Capturas de pantalla incluidas:
  - `⌃⇧⌘3` / `⌃⇧⌘4` (captura al portapapeles), y
  - `⇧⌘3` / `⇧⌘4` / `⇧⌘5` (capturas guardadas como archivo, se detectan con Spotlight).
- ⌨️ Atajo global **`⇧⌘V`** para abrir el historial. Se puede cambiar a `⌃⌘V`, `⌃⇧⌘V` o `⌥⌘V`.
- 🔎 Escribe para buscar.
- Muévete con `↑` `↓` y pulsa `↩` para pegar, o haz **clic** en un elemento.
- `⌘1`…`⌘9` pegan directamente uno de los primeros 9 elementos.
- `⌘⌫` borra el elemento seleccionado, `esc` cierra el panel.
- 🌍 Disponible en **inglés** (por defecto), **español** y **हिन्दी** (hindi). Cámbialo desde el menú → *Idioma*. [¡Ayuda a traducirlo a tu idioma!](#ayuda-a-traducir-clipstack)
- El historial se mantiene al reiniciar el Mac.
- Ignora las contraseñas copiadas desde gestores (1Password, Bitwarden, etc.).
- Vive en la barra de menús, sin icono en el Dock.

## Requisitos

macOS 13 (Ventura) o superior, en Mac con Apple Silicon o Intel.

## Permisos

- **Accesibilidad** (Ajustes del Sistema → Privacidad y seguridad → Accesibilidad):
  ClipStack lo necesita para pegar automáticamente (simula `⌘V`).
  Sin él, el elemento elegido se copia al portapapeles y tú pulsas `⌘V`.
- **Escritorio / Documentos**: macOS lo pide la primera vez para que ClipStack pueda leer
  las capturas guardadas como archivo.

## Privacidad

Todo se queda en tu Mac, en `~/Library/Application Support/ClipStack/`
(`history.json` e imágenes en `images/`). ClipStack nunca se conecta a internet.

## Sobre `⇧⌘V`

Algunas apps usan `⇧⌘V` para "Pegar sin formato". Mientras ClipStack esté abierto,
el atajo abre el historial. Puedes cambiarlo desde el menú → *Atajo de teclado*.

## Compilar desde el código

Necesitas Xcode o las Command Line Tools (`xcode-select --install`).

```bash
git clone https://github.com/Zh0du/clipstack.git
cd clipstack
./scripts/build-app.sh --dmg      # crea build/ClipStack.app y build/ClipStack.dmg
```

Para desarrollar: `swift run`.

### Publicar una nueva versión

Sube una etiqueta de versión. GitHub Actions compila el instalador y lo adjunta a un nuevo release:

```bash
git tag v1.0.0
git push origin v1.0.0
```

## Ayuda a traducir ClipStack

Hoy ClipStack está en inglés, español e hindi, y me encantaría llevarlo a más personas. **¡Puedes ayudar!**
Son especialmente bienvenidas las traducciones a 简体中文 (chino), português, français, deutsch y 日本語,
pero cualquier idioma suma. 👉 **[Mira los issues de traducción abiertos](https://github.com/Zh0du/clipstack/issues?q=is%3Aissue+is%3Aopen+label%3Atranslation)** y comenta en el que quieras hacer.

1. Haz un fork del repo.
2. En `Sources/ClipStack/Localization.swift`, añade tu idioma a `AppLanguage`
   (por ejemplo `case french = "fr"`) y su nombre en `displayName`.
3. Traduce cada clave de `Strings.table`.
4. Copia `Resources/en.lproj` a `Resources/<código>.lproj`, traduce `InfoPlist.strings`
   y añade tu código a `CFBundleLocalizations` en `Resources/Info.plist`.
5. Abre un pull request. Las revisiones de hablantes nativos también ayudan muchísimo.

## Autor

Hecho por **Zh0du**

- GitHub: [@Zh0du](https://github.com/Zh0du)

Si ClipStack te resulta útil, dale una ⭐ al repo.

## Licencia

[MIT](LICENSE). Libre para usar, modificar y compartir.
