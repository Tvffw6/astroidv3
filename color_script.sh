#!/bin/bash

# Script pour changer toutes les couleurs en nuances de bleu
# Exécutez ce script à la racine de votre projet

echo "🎨 Début du changement des couleurs en bleu..."

# Couleurs bleues à utiliser
PRIMARY_BLUE="#1e40af"      # Bleu primaire foncé
SECONDARY_BLUE="#3b82f6"    # Bleu moyen
LIGHT_BLUE="#60a5fa"        # Bleu clair
DARK_BLUE="#1e3a8a"         # Bleu très foncé
ACCENT_BLUE="#2563eb"       # Bleu accent

# Fonction pour remplacer les couleurs dans les fichiers CSS
replace_colors_css() {
    find . -type f \
        -not -path "*/node_modules/*" \
        -not -path "*/.git/*" \
        \( -name "*.css" -o -name "*.scss" -o -name "*.sass" \) \
        -exec sed -i '' \
        -e "s/#[0-9a-fA-F]\{6\}/$PRIMARY_BLUE/g" \
        -e "s/#[0-9a-fA-F]\{3\}/$PRIMARY_BLUE/g" \
        -e "s/rgb([^)]*)/rgb(30, 64, 175)/g" \
        -e "s/rgba([^)]*)/rgba(30, 64, 175, 0.9)/g" \
        {} +
}

# Fonction pour remplacer dans les fichiers JS/HTML
replace_colors_js_html() {
    find . -type f \
        -not -path "*/node_modules/*" \
        -not -path "*/.git/*" \
        \( -name "*.js" -o -name "*.html" -o -name "*.ejs" \) \
        -exec sed -i '' \
        -e "s/#[0-9a-fA-F]\{6\}/$SECONDARY_BLUE/g" \
        -e "s/#[0-9a-fA-F]\{3\}/$SECONDARY_BLUE/g" \
        {} +
}

# Crée un fichier de configuration des couleurs
create_color_config() {
    cat > colors.json << EOF
{
  "colors": {
    "primary": "$PRIMARY_BLUE",
    "secondary": "$SECONDARY_BLUE",
    "light": "$LIGHT_BLUE",
    "dark": "$DARK_BLUE",
    "accent": "$ACCENT_BLUE"
  }
}
EOF
    echo "📄 Fichier colors.json créé avec la palette bleue"
}

# Crée un fichier CSS avec les variables
create_css_variables() {
    cat > public/assets/css/colors.css << EOF
/* Palette de couleurs bleues pour HomebrewChannel */
:root {
    --primary-blue: $PRIMARY_BLUE;
    --secondary-blue: $SECONDARY_BLUE;
    --light-blue: $LIGHT_BLUE;
    --dark-blue: $DARK_BLUE;
    --accent-blue: $ACCENT_BLUE;
    
    /* Alias pour faciliter l'utilisation */
    --primary-color: var(--primary-blue);
    --secondary-color: var(--secondary-blue);
    --background-color: var(--dark-blue);
    --text-color: #ffffff;
    --accent-color: var(--accent-blue);
}

/* Styles de base avec thème bleu */
body {
    background: linear-gradient(135deg, var(--dark-blue) 0%, var(--primary-blue) 100%);
    color: var(--text-color);
}

.button, button {
    background-color: var(--secondary-blue);
    border: 2px solid var(--accent-blue);
}

.button:hover, button:hover {
    background-color: var(--accent-blue);
}

a {
    color: var(--light-blue);
}

a:hover {
    color: var(--secondary-blue);
}
EOF
    echo "📄 Fichier public/assets/css/colors.css créé"
}

# Exécute les remplacements
echo "🔄 Remplacement des couleurs dans CSS..."
replace_colors_css

echo "🔄 Remplacement des couleurs dans JS/HTML..."
replace_colors_js_html

echo "📝 Création des fichiers de configuration..."
create_color_config

# Crée le répertoire si nécessaire
mkdir -p public/assets/css
create_css_variables

echo ""
echo "✅ Changement de couleurs terminé!"
echo ""
echo "📋 Palette bleue appliquée:"
echo "   Bleu primaire foncé: $PRIMARY_BLUE"
echo "   Bleu moyen: $SECONDARY_BLUE"
echo "   Bleu clair: $LIGHT_BLUE"
echo "   Bleu très foncé: $DARK_BLUE"
echo "   Bleu accent: $ACCENT_BLUE"
echo ""
echo "📄 Fichiers créés:"
echo "   - colors.json (configuration des couleurs)"
echo "   - public/assets/css/colors.css (variables CSS)"
echo ""
echo "⚠️  N'oubliez pas d'importer colors.css dans vos fichiers HTML:"
echo '   <link rel="stylesheet" href="/assets/css/colors.css">'
echo ""
echo "✨ Terminé!"
