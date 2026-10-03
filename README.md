# test-project

Coding-Test-Projekt.

## Erste Schritte

```bash
git clone https://github.com/mlorup/test-project.git
cd test-project
```

## Dashboards

Die Board-Dashboards liegen in `dashboard/` und werden über GitHub Pages veröffentlicht:

- Übersicht: https://mlorup.github.io/test-project/
- UBS 2Q26: https://mlorup.github.io/test-project/dashboard/ubs-2q26.html
- Swiss Life HJ 2026: https://mlorup.github.io/test-project/dashboard/swisslife-hy26.html

Jeder Push auf `main` baut die Site neu (`.github/workflows/pages.yml`). Lokal bauen:

```bash
./scripts/build-pages.sh   # Ausgabe in _site/
```

## Projektstruktur

```
.
├── .github/workflows/pages.yml   # Deployment auf GitHub Pages
├── dashboard/                    # Dashboards (HTML-Fragmente)
├── scripts/build-pages.sh        # Baut die Pages-Site nach _site/
├── .editorconfig                 # Einheitliche Editor-Einstellungen
├── .gitignore                    # Von Git ignorierte Dateien
└── README.md
```
