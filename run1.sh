#tool=dot
tool=neato
$tool -Tpng $1.dot >$1.png
$tool -Tsvg $1.dot >$1.svg
if [ $# -eq 0 ]; then echo "Erreur : argument manquant (nom du fichier .dot sans extension)"; exit 1; fi