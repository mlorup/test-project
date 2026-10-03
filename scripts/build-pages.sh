#!/usr/bin/env bash
# Baut die GitHub-Pages-Site nach _site/.
# Die Dashboards sind als Seitenfragmente geschrieben (ohne doctype/head),
# daher wird hier das HTML-Grundgerüst ergänzt und eine Übersichtsseite erzeugt.
set -euo pipefail

out="${1:-_site}"
rm -rf "$out"
mkdir -p "$out/dashboard"

head='<!doctype html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<style>body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>
</head>
<body>'
foot='</body>
</html>'

links=""
for f in dashboard/*.html; do
  name="$(basename "$f")"
  { echo "$head"; cat "$f"; echo "$foot"; } > "$out/dashboard/$name"
  title="$(grep -o -m1 '<title>[^<]*</title>' "$f" | sed 's#</\?title>##g')"
  links+="    <li><a href=\"dashboard/$name\">${title:-$name}</a></li>"$'\n'
done

cat > "$out/index.html" <<HTML
<!doctype html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Board-Dashboards</title>
<style>
  :root { --bg: #f5f6f8; --fg: #17202b; --muted: #5b6676; --accent: #1f4e79; }
  @media (prefers-color-scheme: dark) { :root { --bg: #11161d; --fg: #e8ecf1; --muted: #9aa5b4; --accent: #7fb0dc; color-scheme: dark; } }
  body { margin: 0; background: var(--bg); color: var(--fg); font: 16px/1.5 "Segoe UI", system-ui, sans-serif; }
  main { max-width: 720px; margin: 0 auto; padding: 40px 20px; }
  h1 { font-family: Georgia, serif; font-weight: 600; margin: 0 0 8px; }
  p { color: var(--muted); margin: 0 0 24px; }
  ul { padding-left: 20px; }
  li { margin: 8px 0; }
  a { color: var(--accent); }
</style>
</head>
<body>
<main>
  <h1>Board-Dashboards</h1>
  <p>Unabhängige Zusammenstellungen aus öffentlich verfügbaren Quellen. Keine offiziellen Dokumente der Unternehmen.</p>
  <ul>
$links  </ul>
</main>
</body>
</html>
HTML

touch "$out/.nojekyll"
echo "Site gebaut in $out/"
