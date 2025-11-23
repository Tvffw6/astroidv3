#!/bin/bash

# Script pour renommer Astroid en HomebrewChannel dans tous les fichiers
# Exécutez ce script à la racine de votre projet

echo "🔄 Début du renommage Astroid → HomebrewChannel..."

# Fonction pour renommer dans les fichiers
rename_in_files() {
    # Trouve tous les fichiers (exclut node_modules, .git, etc.)
    find . -type f \
        -not -path "*/node_modules/*" \
        -not -path "*/.git/*" \
        -not -path "*/dist/*" \
        -not -path "*/build/*" \
        \( -name "*.js" -o -name "*.json" -o -name "*.html" -o -name "*.css" -o -name "*.md" -o -name "*.txt" -o -name "*.ejs" \) \
        -exec sed -i '' \
        -e 's/Astroid/HomebrewChannel/g' \
        -e 's/astroid/homebrewchannel/g' \
        -e 's/ASTROID/HOMEBREWCHANNEL/g' \
        {} +
}

# Exécute le renommage
rename_in_files

echo "✅ Renommage terminé dans les fichiers!"

# Affiche un résumé
echo ""
echo "📋 Résumé des changements:"
echo "   Astroid → HomebrewChannel"
echo "   astroid → homebrewchannel"
echo "   ASTROID → HOMEBREWCHANNEL"
echo ""
echo "⚠️  N'oubliez pas de:"
echo "   1. Vérifier package.json (nom du projet)"
echo "   2. Vérifier les URLs et domaines"
echo "   3. Tester l'application après les changements"
echo ""
echo "✨ Terminé!"
