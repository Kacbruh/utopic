#!/usr/bin/env bash
# download-assets.sh — Récupère toutes les images depuis wixstatic.com
# Usage : bash download-assets.sh

set -euo pipefail

IMAGES_DIR="assets/images"
LOGOS_DIR="assets/logos"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"

mkdir -p "$IMAGES_DIR" "$LOGOS_DIR"

download() {
  local url="$1"
  local out="$2"
  if [[ -f "$out" ]]; then
    echo "  [skip] $out déjà présent"
    return
  fi
  echo "  [dl]   $out"
  curl -L --silent --user-agent "$UA" -o "$out" "$url"
}

echo "=== Logos ==="
download \
  "https://static.wixstatic.com/media/594907_baf32534233144f9b0d2f11964ee949c~mv2.png" \
  "$LOGOS_DIR/logo-utopic.png"

download \
  "https://static.wixstatic.com/media/594907_7f0e420f392f48dc97ede12c7d854b73~mv2.png" \
  "$LOGOS_DIR/logo-utopic-mini.png"

echo "=== Portrait ==="
download \
  "https://static.wixstatic.com/media/594907_bef66fc3cae04b7889babc901d31aecc~mv2.png" \
  "$IMAGES_DIR/portrait-clea.png"

echo "=== Presse ==="
download \
  "https://static.wixstatic.com/media/594907_618392f476864492aa86940c8e97a509~mv2.jpg" \
  "$IMAGES_DIR/presse-votre-agglo.jpg"

echo "=== Prestations ==="
download \
  "https://static.wixstatic.com/media/594907_18c3208ba2944c37a4f77a23463cb005~mv2.jpg" \
  "$IMAGES_DIR/presta-identite.jpg"

download \
  "https://static.wixstatic.com/media/594907_9901e7af70bf48b09f4958a14477c862~mv2.jpg" \
  "$IMAGES_DIR/presta-print.jpg"

download \
  "https://static.wixstatic.com/media/594907_fd8ca46744b14ddcbd11047f720ee332~mv2.jpeg" \
  "$IMAGES_DIR/presta-digitale.jpeg"

echo ""
echo "=== Projets portfolio (à compléter) ==="
echo "  Pour récupérer les images de tes projets :"
echo "  1. Ouvre le site Wix dans Chrome"
echo "  2. DevTools (F12) > onglet Network > filtre 'Img'"
echo "  3. Recharge la page"
echo "  4. Copie les URLs wixstatic.com et ajoute-les ici :"
echo ""
echo "  Exemple :"
echo "  download \"https://static.wixstatic.com/media/TON_ID~mv2.jpg\" \\"
echo "           \"\$IMAGES_DIR/projet-nom.jpg\""

echo ""
echo "✓ Téléchargement terminé. Fichiers dans assets/"
