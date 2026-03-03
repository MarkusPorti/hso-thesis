#import "@local/hso-thesis:0.1.0": company, faculty, styles, supervisor, thesis, thesis-info, thesis-type

// Definition der Metadaten
#let info = thesis-info(
  lang: "de",
  thesis-type: thesis-type.BACHELOR,
  title: "Haupttitel der Bachelorthesis",
  subtitle: "Untertitel",
  author: "Max Mustermann",
  degree: "Informatik",
  faculty: faculty.EMI,
  period: [01.01.2026 -- 30.06.2026],
  supervisors: (
    supervisor(name: "Prof. Dr. Max Mustermann", institution: "Hochschule Offenburg", gender: "m"),
    supervisor(name: "Maxi Musterfrau", institution: "Musterfirma"),
  ),
  companies: (
    company(name: "Musterfirma GmbH"),
  ),
  location: "Offenburg", // Wird bei der Unterschrift der Eidesstattlichen Erklärung verwendet
  copyright: true,
  glossary: yaml("glossary.yaml"),
  bibliography: read("Bibliography.yaml", encoding: none),
  bibliography-style: read("ieee.csl", encoding: none),
)

// Hauptfunktion der Vorlage
#show: thesis.with(
  info: info,
  style: styles.emi,
  abstract: include "abstract.typ",
  appendix: include "appendix.typ"
)

#include "chapters/chapter1.typ"
