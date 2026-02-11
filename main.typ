#import "template.typ": *

// Initialisierung der Vorlage mit deinen Daten
#show: project.with(
  title: "Meine Bachelorthesis",
  subtitle: "Eine zweite Überschrift",
  author: "Markus Portugall",
  degree: "Informatik",
  period: [01.01.2025 -- 31.06.2025],
  supervisors: (
    company: "Betreuer 1",
    university: "Betreuer 2"
  ),
  companies: (
    c1: "Firma 1",
    c2: "Firma 2"
  ),
  logo_hs: "img/logo_hs.png", 
  // logo_company1: "img/logo_scieneers.png",
  // logo_company2: "img/logo_ivu.png",
)

// --- Kapitel Einbinden ---
#include "chapters/Einführung_Typst.typ"
