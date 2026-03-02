# Typst Thesis Template - Hochschule Offenburg (EMI)

Dies ist ein Typst-Package für Bachelor- und Masterthesen an der Fakultät EMI der Hochschule Offenburg. Es folgt dem offiziellen Leitfaden für wissenschaftliches Arbeiten.

## Installation (Lokal)

Um dieses Package lokal zu nutzen, kopieren Sie den Inhalt dieses Verzeichnisses in den lokalen Typst-Package-Ordner:

- **Windows:** `%APPDATA%\typst\packages\local\hso-thesis\0.1.0\`
- **macOS:** `~/Library/Application Support/typst/packages/local/hso-thesis/0.1.0/`
- **Linux:** `~/.local/share/typst/packages/local/hso-thesis/0.1.0/`

## Nutzung als Template

Sobald das Package installiert ist, können Sie ein neues Projekt mit folgendem Befehl initialisieren:

```bash
typst init @local/hso-thesis:0.1.0
```

## Nutzung als Bibliothek

Sie können die Funktionen des Packages auch in einem bestehenden Projekt nutzen:

```typst
#import "@local/hso-thesis:0.1.0": *

#show: project.with(
  title: "Titel der Thesis",
  author: "Dein Name",
  // ... weitere Parameter
)

= Einleitung
...
```

## Parameter der `project` Funktion

Die `project` Funktion unterstützt folgende Parameter:

- `title`: Titel der Arbeit
- `subtitle`: Untertitel (optional)
- `author`: Name des Autors
- `degree`: Studiengang
- `period`: Bearbeitungszeitraum
- `supervisors`: Dictionary mit `company` und `university` Betreuern
- `companies`: Dictionary mit Firmennamen (`c1`, `c2`)
- `logo_hs`: Pfad zum HS-Offenburg Logo
- `logo_company1`, `logo_company2`: Pfade zu Firmenlogos (optional)
- `glossary_data`: Geladene YAML-Daten für das Glossar (z.B. `yaml("glossary.yaml")`)
- `bibliography_file`: Pfad zur Literaturdatei
- `bibliography_style`: Zitationsstil (Standard: `"ieee"`)
- `appendix`: Inhalt des Anhangs (z.B. `include "appendix.typ"`)
