import Foundation

/// Languages the user can pick from the menu. English is the default.
enum AppLanguage: String, CaseIterable {
    case english = "en"
    case spanish = "es"
    case hindi = "hi"
    case korean = "ko"

    /// Each language is shown in its own name so anyone can find theirs.
    var displayName: String {
        switch self {
        case .english: return "English"
        case .spanish: return "Español"
        case .hindi: return "हिन्दी"
        case .korean: return "한국어"
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
            .hindi: "क्लिपबोर्ड में खोजें…",
            .korean: "클립보드 검색…",
        ],
        "empty.none": [
            .english: "You haven't copied anything yet",
            .spanish: "Aún no has copiado nada",
            .hindi: "आपने अभी तक कुछ भी कॉपी नहीं किया है",
            .korean: "아직 복사한 항목이 없습니다",
        ],
        "empty.noResults": [
            .english: "No results",
            .spanish: "Sin resultados",
            .hindi: "कोई परिणाम नहीं",
            .korean: "검색 결과 없음",
        ],
        "footer.navigate": [
            .english: "↑↓ navigate",
            .spanish: "↑↓ navegar",
            .hindi: "↑↓ नेविगेट",
            .korean: "↑↓ 이동",
        ],
        "footer.paste": [
            .english: "↩ paste",
            .spanish: "↩ pegar",
            .hindi: "↩ पेस्ट",
            .korean: "↩ 붙여넣기",
        ],
        "footer.quick": [
            .english: "⌘1–9 quick paste",
            .spanish: "⌘1–9 rápido",
            .hindi: "⌘1–9 झटपट पेस्ट",
            .korean: "⌘1–9 빠른 붙여넣기",
        ],
        "footer.delete": [
            .english: "⌘⌫ delete",
            .spanish: "⌘⌫ borrar",
            .hindi: "⌘⌫ हटाएँ",
            .korean: "⌘⌫ 삭제",
        ],

        // Rows
        "row.imageUnavailable": [
            .english: "Image unavailable",
            .spanish: "Imagen no disponible",
            .hindi: "इमेज उपलब्ध नहीं है",
            .korean: "이미지를 불러올 수 없음",
        ],
        "row.characters": [
            .english: "%d characters",
            .spanish: "%d caracteres",
            .hindi: "%d अक्षर",
            .korean: "%d자",
        ],
        "row.screenshot": [
            .english: "Screenshot",
            .spanish: "Captura de pantalla",
            .hindi: "स्क्रीनशॉट",
            .korean: "스크린샷",
        ],
        "row.oneFile": [
            .english: "1 file",
            .spanish: "1 archivo",
            .hindi: "1 फ़ाइल",
            .korean: "파일 1개",
        ],
        "row.files": [
            .english: "%d files",
            .spanish: "%d archivos",
            .hindi: "%d फ़ाइलें",
            .korean: "파일 %d개",
        ],

        // Menu
        "menu.show": [
            .english: "Show history (%@)",
            .spanish: "Mostrar historial (%@)",
            .hindi: "इतिहास दिखाएँ (%@)",
            .korean: "기록 보기 (%@)",
        ],
        "menu.hotKey": [
            .english: "Keyboard shortcut",
            .spanish: "Atajo de teclado",
            .hindi: "कीबोर्ड शॉर्टकट",
            .korean: "단축키",
        ],
        "menu.historySize": [
            .english: "History size",
            .spanish: "Tamaño del historial",
            .hindi: "इतिहास का आकार",
            .korean: "기록 보관 개수",
        ],
        "menu.items": [
            .english: "%d items",
            .spanish: "%d elementos",
            .hindi: "%d आइटम",
            .korean: "%d개",
        ],
        "menu.captureScreenshots": [
            .english: "Save screenshots",
            .spanish: "Guardar capturas de pantalla",
            .hindi: "स्क्रीनशॉट सहेजें",
            .korean: "스크린샷 저장",
        ],
        "menu.autoPaste": [
            .english: "Paste automatically when chosen",
            .spanish: "Pegar automáticamente al elegir",
            .hindi: "चुनते ही अपने आप पेस्ट करें",
            .korean: "선택 시 자동으로 붙여넣기",
        ],
        "menu.launchAtLogin": [
            .english: "Open at login",
            .spanish: "Abrir al iniciar sesión",
            .hindi: "लॉगिन पर खोलें",
            .korean: "로그인 시 자동 실행",
        ],
        "menu.pause": [
            .english: "Pause capturing",
            .spanish: "Pausar captura",
            .hindi: "कैप्चर रोकें",
            .korean: "기록 일시 정지",
        ],
        "menu.language": [
            .english: "Language",
            .spanish: "Idioma",
            .hindi: "भाषा",
            .korean: "언어",
        ],
        "menu.grantAccessibility": [
            .english: "⚠️ Grant Accessibility permission…",
            .spanish: "⚠️ Dar permiso de Accesibilidad…",
            .hindi: "⚠️ एक्सेसिबिलिटी अनुमति दें…",
            .korean: "⚠️ 손쉬운 사용 권한 허용…",
        ],
        "menu.clearHistory": [
            .english: "Clear history…",
            .spanish: "Borrar historial…",
            .hindi: "इतिहास साफ़ करें…",
            .korean: "기록 지우기…",
        ],
        "menu.quit": [
            .english: "Quit ClipStack",
            .spanish: "Salir de ClipStack",
            .hindi: "ClipStack बंद करें",
            .korean: "ClipStack 종료",
        ],

        // Alerts
        "alert.hotKeyFailed.title": [
            .english: "Couldn't register the shortcut %@",
            .spanish: "No se pudo registrar el atajo %@",
            .hindi: "शॉर्टकट %@ सेट नहीं किया जा सका",
            .korean: "단축키 %@을(를) 등록할 수 없습니다",
        ],
        "alert.hotKeyFailed.body": [
            .english: "Another app may be using it. Choose a different shortcut from the ClipStack menu.",
            .spanish: "Puede que otra app lo esté usando. Elige otro atajo desde el menú de ClipStack.",
            .hindi: "हो सकता है कोई दूसरा ऐप इसका उपयोग कर रहा हो। ClipStack मेनू से कोई दूसरा शॉर्टकट चुनें।",
            .korean: "다른 앱에서 이미 사용 중일 수 있습니다. ClipStack 메뉴에서 다른 단축키를 선택해 주세요.",
        ],
        "alert.clear.title": [
            .english: "Clear the entire history?",
            .spanish: "¿Borrar todo el historial?",
            .hindi: "पूरा इतिहास साफ़ करें?",
            .korean: "전체 기록을 지우시겠습니까?",
        ],
        "alert.clear.body": [
            .english: "All saved text, images and screenshots will be deleted.",
            .spanish: "Se eliminarán todos los textos, imágenes y capturas guardados.",
            .hindi: "सहेजे गए सभी टेक्स्ट, इमेज और स्क्रीनशॉट हटा दिए जाएँगे।",
            .korean: "저장된 모든 텍스트, 이미지 및 스크린샷이 삭제됩니다.",
        ],
        "alert.clear.confirm": [
            .english: "Clear",
            .spanish: "Borrar",
            .hindi: "साफ़ करें",
            .korean: "지우기",
        ],
        "alert.cancel": [
            .english: "Cancel",
            .spanish: "Cancelar",
            .hindi: "रद्द करें",
            .korean: "취소",
        ],
    ]
}
