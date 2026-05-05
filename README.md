# Utopi'C — Site vitrine

Site de Cléa LAUBIER, graphiste & communicante freelance.  
HTML/CSS/JS statique, hébergé sur GitHub Pages avec domaine custom `utopi-c.com`.

---

## Stack

- HTML5 + CSS3 + JS vanilla (zéro framework)
- Hébergement : GitHub Pages (gratuit)
- Formulaire de contact : Formspree (50 soumissions/mois gratuit)
- Polices : Cormorant Garamond + DM Sans via Google Fonts

---

## Structure

```
utopic/
├── index.html
├── a-propos.html
├── portfolio.html
├── identite-visuelle.html
├── communication-print.html
├── communication-digitale.html
├── contact.html
├── mentions-legales.html
├── politique-confidentialite.html
├── css/
│   ├── style.css          ← variables, navbar, hero, footer, carousel
│   ├── a-propos.css
│   ├── contact.css
│   ├── portfolio.css
│   └── legal.css
├── js/
│   ├── main.js            ← navbar, carousel, hamburger
│   └── contact.js         ← envoi formulaire AJAX
├── assets/
│   ├── images/
│   └── logos/
└── download-assets.sh     ← script pour récupérer les images Wix
```

---

## Déploiement GitHub Pages

### 1. Créer le dépôt GitHub

1. Créer un repo public nommé `utopi-c` (ou autre nom)
2. Dans le terminal, depuis le dossier `utopic/` :

```bash
git init
git add .
git commit -m "init: migration Wix → HTML statique"
git branch -M main
git remote add origin https://github.com/TON_USERNAME/utopi-c.git
git push -u origin main
```

### 2. Activer GitHub Pages

1. Aller dans **Settings** → **Pages**
2. Source : `Deploy from a branch`
3. Branch : `main` / `/ (root)`
4. Cliquer **Save**

Le site sera disponible sur : `https://TON_USERNAME.github.io/utopi-c`

### 3. Connecter le domaine custom `utopi-c.com`

**Chez le registrar (OVH, Namecheap, Gandi…) — ajouter ces enregistrements DNS :**

| Type  | Nom | Valeur                  |
|-------|-----|-------------------------|
| A     | @   | 185.199.108.153         |
| A     | @   | 185.199.109.153         |
| A     | @   | 185.199.110.153         |
| A     | @   | 185.199.111.153         |
| CNAME | www | TON_USERNAME.github.io  |

**Dans GitHub Pages Settings :**

1. Custom domain → entrer `utopi-c.com`
2. Cocher **Enforce HTTPS** (disponible après propagation DNS, ~24-48h)

---

## Formulaire de contact (Formspree)

1. Créer un compte sur [formspree.io](https://formspree.io)
2. Créer un nouveau formulaire → copier l'ID (ex: `xpzgabcd`)
3. Dans `contact.html`, remplacer :
   ```html
   action="https://formspree.io/f/VOTRE_ID"
   ```
   par :
   ```html
   action="https://formspree.io/f/xpzgabcd"
   ```

---

## Police Magiona Display (optionnel)

Si le fichier `.woff2` de Magiona Display est disponible, placer dans `assets/fonts/` et décommenter dans `css/style.css` :

```css
@font-face {
  font-family: 'Magiona Display';
  src: url('../assets/fonts/magiona-display.woff2') format('woff2');
  font-weight: 400 700;
  font-style: normal;
  font-display: swap;
}
```

Puis changer la variable :
```css
--font-display: 'Magiona Display', 'Cormorant Garamond', Georgia, serif;
```

---

## Récupérer les images du site Wix

```bash
bash download-assets.sh
```

Pour les images de projets manquantes :
1. Ouvrir le site Wix dans Chrome → F12 → onglet Network → filtre "Img"
2. Recharger la page
3. Copier les URLs `wixstatic.com`
4. Les ajouter dans `download-assets.sh` puis relancer

---

## Charte graphique

| Token           | Valeur    |
|-----------------|-----------|
| Navy            | `#12263e` |
| Teal            | `#00756f` |
| Coral           | `#fe6751` |
| Gold            | `#c9a708` |
| Cream (bg)      | `#f5eee6` |
| Titres          | Cormorant Garamond (→ Magiona Display si dispo) |
| Corps / Nav     | DM Sans (→ Avenir Next si dispo) |
