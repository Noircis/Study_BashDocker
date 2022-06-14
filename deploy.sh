#!/bin/bash

echo "
Option :
- --create : Lancer des conteneurs

- --drop : Supprimer des conteneurs créés par $0

- --infos : caractéristiques des conteneurs(ip, user, nom ...)

- --start : redémarrage des conteneurs

- --ansible : déploiment arborescence ansible
"

echo "scipt has $# arg(s)"
