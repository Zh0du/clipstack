import Foundation

/// Languages the user can pick from the menu. English is the default.
enum AppLanguage: String, CaseIterable {
    case english = "en"
    case spanish = "es"
    case hindi = "hi"

    /// Each language is shown in its own name so anyone can find theirs.
    var displayName: String {
        switch self {
        case .english: return "English"
        case .spanish: return "Español"
        case .hindi: return "हिन्दी"
        }
    }

    var locale: Locale { Locale(identifier: rawValue) }

    static var current: AppLanguage {
        get { UserDefaults.standard.string(forKey: "language").flatMap(AppLanguage.init) ?? .english }
        set { UserDefaults.standard.set(newValue.rawValue, forKey: "language") }
    }
}

/// Returns the translated string for `key`, formatting it with `args` when given.
func L(_ key: String, _ args: CVarArg...) -> String {
    let language = AppLanguage.current
    let format = Strings.table[key]?[language] ?? Strings.table[key]?[.english] ?? key
    return args.isEmpty ? format : String(format: format, locale: language.locale, arguments: args)
}

private enum Strings {
    static let table: [String: [AppLanguage: String]] = [
        // Panel
        "search.placeholder": [
            .english: "Search clipboard…",
            .spanish: "Buscar en el portapapeles…",
            .hindi: "क्लिपबोर्ड में खोजें…"
        ],
        "empty.none": [
            .english: "You haven't copied anything yet",
            .spanish: "Aún no has copiado nada",
            .hindi: "आपने अभी तक कुछ भी कॉपी नहीं किया है",
        ],
        "empty.noResults": [
            .english: "No results",
            .spanish: "Sin resultados",
            .hindi: "कोई परिणाम नहीं",
        ],
        "footer.navigate": [
            .english: "↑↓ navigate",
            .spanish: "↑↓ navegar",
            .hindi: "↑↓ नेविगेट",
        ],
        "footer.paste": [
            .english: "↩ paste",
            .spanish: "↩ pegar",
            .hindi: "↩ पेस्ट",
        ],
        "footer.quick": [
            .english: "⌘1–9 quick paste",
            .spanish: "⌘1–9 rápido",
            .hindi: "⌘1–9 झटपट पेस्ट",
        ],
        "footer.delete": [
            .english: "⌘⌫ delete",
            .spanish: "⌘⌫ borrar",
            .hindi: "⌘⌫ हटाएँ",
        ],

        // Rows
        "row.imageUnavailable": [
            .english: "Image unavailable",
            .spanish: "Imagen no disponible",
            .hindi: "इमेज उपलब्ध नहीं है",
        ],
        "row.characters": [
            .english: "%d characters",
            .spanish: "%d caracteres",
            .hindi: "%d अक्षर",
        ],
        "row.screenshot": [
            .english: "Screenshot",
            .spanish: "Captura de pantalla",
            .hindi: "स्क्रीनशॉट",
        ],
        "row.oneFile": [
            .english: "1 file",
            .spanish: "1 archivo",
            .hindi: "1 फ़ाइल",
        ],
        "row.files": [
            .english: "%d files",
            .spanish: "%d archivos",
            .hindi: "%d फ़ाइलें",
        ],

        // Menu
        "menu.show": [
            .english: "Show history (%@)",
            .spanish: "Mostrar historial (%@)",
            .hindi: "इतिहास दिखाएँ (%@)",
        ],
        "menu.hotKey": [
            .english: "Keyboard shortcut",
            .spanish: "Atajo de teclado",
            .hindi: "कीबोर्ड शॉर्टकट",
        ],
        "menu.historySize": [
            .english: "History size",
            .spanish: "Tamaño del historial",
            .hindi: "इतिहास का आकार",
        ],
        "menu.items": [
            .english: "%d items",
            .spanish: "%d elementos",
            .hindi: "%d आइटम",
        ],
        "menu.captureScreenshots": [
            .english: "Save screenshots",
            .spanish: "Guardar capturas de pantalla",
            .hindi: "स्क्रीनशॉट सहेजें",
        ],
        "menu.autoPaste": [
            .english: "Paste automatically when chosen",
            .spanish: "Pegar automáticamente al elegir",
            .hindi: "चुनते ही अपने आप पेस्ट करें",
        ],
        "menu.launchAtLogin": [
            .english: "Open at login",
            .spanish: "Abrir al iniciar sesión",
            .hindi: "लॉगिन पर खोलें",
        ],
        "menu.pause": [
            .english: "Pause capturing",
            .spanish: "Pausar captura",
            .hindi: "कैप्चर रोकें",
        ],
        "menu.language": [
            .english: "Language",
            .spanish: "Idioma",
            .hindi: "भाषा",
        ],
        "menu.grantAccessibility": [
            .english: "⚠️ Grant Accessibility permission…",
            .spanish: "⚠️ Dar permiso de Accesibilidad…",
            .hindi: "⚠️ एक्सेसिबिलिटी अनुमति दें…",
        ],
        "menu.clearHistory": [
            .english: "Clear history…",
            .spanish: "Borrar historial…",
            .hindi: "इतिहास साफ़ करें…",
        ],
        "menu.quit": [
            .english: "Quit ClipStack",
            .spanish: "Salir de ClipStack",
            .hindi: "ClipStack बंद करें",
        ],

        // Alerts
        "alert.hotKeyFailed.title": [
            .english: "Couldn't register the shortcut %@",
            .spanish: "No se pudo registrar el atajo %@",
            .hindi: "शॉर्टकट %@ सेट नहीं किया जा सका",
        ],
        "alert.hotKeyFailed.body": [
            .english: "Another app may be using it. Choose a different shortcut from the ClipStack menu.",
            .spanish: "Puede que otra app lo esté usando. Elige otro atajo desde el menú de ClipStack.",
            .hindi: "हो सकता है कोई दूसरा ऐप इसका उपयोग कर रहा हो। ClipStack मेनू से कोई दूसरा शॉर्टकट चुनें।",
        ],
        "alert.clear.title": [
            .english: "Clear the entire history?",
            .spanish: "¿Borrar todo el historial?",
            .hindi: "पूरा इतिहास साफ़ करें?",
        ],
        "alert.clear.body": [
            .english: "All saved text, images and screenshots will be deleted.",
            .spanish: "Se eliminarán todos los textos, imágenes y capturas guardados.",
            .hindi: "सहेजे गए सभी टेक्स्ट, इमेज और स्क्रीनशॉट हटा दिए जाएँगे।",
        ],
        "alert.clear.confirm": [
            .english: "Clear",
            .spanish: "Borrar",
            .hindi: "साफ़ करें",
        ],
        "alert.cancel": [
            .english: "Cancel",
            .spanish: "Cancelar",
            .hindi: "रद्द करें",
        ],
    ]
}
