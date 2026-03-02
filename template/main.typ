#import "@local/hso-thesis:0.1.0": thesis, thesis-info, supervisor, company, study-period, faculty, thesis-type, translations, styles

#let lang = "de"
#let translations = translations(lang)

// Definition der Metadaten
#let info = thesis-info(
  lang: "de",
  thesis-type: thesis-type.BACHELOR,
  title: "Haupttitel der Bachelorthesis",
  subtitle: "Untertitel",
  author: "Max Mustermann",
  degree: "Informatik",
  faculty: faculty.EMI,
  period: study-period(
    from: datetime(year: 2026, month: 1, day: 1),
    to: datetime(year: 2026, month: 5, day: 28)
  ),
  supervisors: (
    supervisor(name: "Prof. Dr. Betreuer", institution: "Musterhochschule"),
    supervisor(name: "Maxi Musterfrau", institution: "Musterfirma"),
  ),
  companies: (
    company(name: "Musterfirma GmbH"),
  ),
  location: "Offenburg", // Wird bei der Unterschrift der Eidesstattlichen Erklärung verwendet
  glossary: yaml("glossary.yaml"),
  bibliography: read("Bibliography.yaml", encoding: none),
  bibliography-style: read("ieee.csl", encoding: none),
)

// Hauptfunktion der Vorlage
#show: thesis.with(
  info: info,
  style: styles.emi,
  translations: translations,
)

#include "chapters/chapter1.typ"