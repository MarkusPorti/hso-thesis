= Template für eine Bachelor-Thesis

== Textbausteine

=== Standards

Einfach schreiben für Absätze.
Text bleibt zusammen.

Eine Zeile frei lassen für neuen Absatz.

==== Aufzählungen
- Einfache Bullet Point Listen
- Mit zwei Einträgen

==== Nummerierte Aufzählunen
1. Selbst nummerierte Aufzählungen
3. Können Zahlen überspringen

==== Mehr nummerierte Aufzählungen
+ Automatisch nummerierte Aufzählungen
+ Muss man nicht selbst mitdenken

=== Zitieren <sec-zitieren>

Einfach @Quelle und sie wird eingebunden. Man kann beim Tippen auch Titel, Autor usw. suchen. Der richtige Key wird dann eingefügt.

Wenn man den Autor nennen will, kann man das so: #cite(<Quelle>, form: "author")

=== Referenzen
Genau wie beim zitieren, kann man auch eigene Keys referenzieren: @sec-zitieren

=== Abkürzungen

You guessed: Einfach `@ML` für @ML.
Bei weiteren Nutzungen dann nur noch @ML.

== Einbinden von Bildern

#figure(
  image("../img/logo_hs.png", width: 20%),
  caption: [Logo der HS-Offenburg],
) <fig:Depotplan>

== Code

```python
#Hier einfach Code schreiben
foo = 2
bar = foo
print(bar)
```

Kann man natürlich auch in einer Figure einpacken:
#figure(
  ```python
  #Hier einfach Code schreiben
  foo = 2
  bar = foo
  print(bar)
  ```,
  caption: [Code mit Bildunterschrift],
) <code-custom-feature-extractor>

== Mathe

Entweder in einer Zeile ohne Leerzeichen $"Formel"=a x+b$ oder als eigenes Figure

$
  F(x) = 123
$

Erkennt automatisch Zeichen wie $pi$ oder $alpha$.