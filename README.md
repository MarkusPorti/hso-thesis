# Typst Thesis Template - Hochschule Offenburg

Dies ist ein Typst-Package für Bachelor-, Masterthesen und Seminararbeiten an der Hochschule Offenburg. Es unterstützt verschiedene Fakultäten und folgt dem offiziellen Leitfaden für wissenschaftliches Arbeiten.

## Unterstützte Fakultäten

Das Template bietet vordefinierte Stile für folgende Fakultäten:
- **EMI:** Elektrotechnik, Medizintechnik und Informatik
- **MV:** Maschinenbau & Verfahrenstechnik
- **W:** Wirtschaft

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
#import "@local/hso-thesis:0.1.0": thesis, thesis-info, supervisor, company, study-period, faculty, thesis-type, styles

// Definition der Metadaten
#let info = thesis-info(
  lang: "de",
  thesis-type: thesis-type.BACHELOR,
  title: "Haupttitel der Thesis",
  subtitle: "Untertitel",
  author: "Max Mustermann",
  degree: "Informatik",
  faculty: faculty.EMI,
  period: study-period(
    from: datetime(year: 2026, month: 1, day: 1),
    to: datetime(year: 2026, month: 5, day: 28)
  ),
  supervisors: (
    supervisor(name: "Prof. Dr. Max Mustermann", institution: "HS Offenburg", gender: "m"),
    supervisor(name: "Maxi Musterfrau", institution: "Musterfirma", gender: "f"),
  ),
  companies: (
    company(name: "Musterfirma GmbH"),
  ),
  location: "Offenburg",
  glossary: yaml("glossary.yaml"),
  bibliography: read("bibliography.bib"),
  bibliography-style: read("ieee.csl"),
)

// Hauptfunktion der Vorlage
#show: thesis.with(
  info: info,
  style: styles.emi, // oder styles.mv, styles.w
  abstract: include "abstract.typ",
  appendix: include "appendix.typ"
)

#include "chapters/chapter1.typ"
```

## Parameter und Hilfsfunktionen

Das Template nutzt strukturierte Datenobjekte für die Konfiguration:

### `thesis-info`
Zentrales Objekt für alle Metadaten der Arbeit.
- `lang`: "de" oder "en"
- `thesis-type`: `thesis-type.BACHELOR`, `MASTER` oder `SEMINAR`
- `faculty`: `faculty.EMI`, `MV` oder `W`
- `title`, `subtitle`: Titel und Untertitel
- `author`: Name des Autors
- `degree`: Studiengang
- `period`: Erstellt mit `study-period()`
- `supervisors`: Array von `supervisor()` Objekten
- `companies`: Array von `company()` Objekten
- `location`: Ort der Unterschrift für die eidesstattliche Erklärung
- `glossary`: Geladene YAML-Daten für das Glossar
- `bibliography`: Inhalt der Literaturdatei (als String/Bytes)
- `bibliography-style`: Inhalt der CSL-Datei (als String/Bytes)

### Hilfsfunktionen
- `supervisor(name, institution, gender)`: Erstellt einen Betreuer. `gender` ist "m" oder "f".
- `company(name, logo)`: Erstellt ein Unternehmen. `logo` ist optional ein `image()`.
- `study-period(from, to)`: Erstellt einen Zeitraum aus zwei `datetime` Objekten.

### `thesis` (Hauptfunktion)
- `info`: Das `thesis-info` Objekt.
- `style`: Der gewünschte Fakultäts-Stil (`styles.emi`, `styles.mv`, `styles.w`).
- `abstract`: Inhalt für die Kurzfassung (optional).
- `appendix`: Inhalt für den Anhang (optional).
- `body`: Der eigentliche Inhalt der Arbeit.
