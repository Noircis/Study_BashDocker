#!/bin/bash

#si option == --create
if [ "$1" == "--create" ]; then
  echo "notre option est --create"
#si option == --drop
elif [ "$1" == "--drop" ]; then
  echo "notre option est --drop"
#si option == --infos
elif [ "$1" == "--infos" ]; then
  echo "notre option est --infos"
#si option == --start
elif [ "$1" == "--start" ]; then
  echo "notre option est --start"
#si option == --ansible
elif [ "$1" == "--ansible" ]; then
  echo "notre option est --ansible"

# si aucune option, l'aide s'affiche
else
  echo "
  Option :
  - --create  : Lancer des conteneurs
  - --drop    : Supprimer des conteneurs créés par $0
  - --infos   : caractéristiques des conteneurs(ip, user, nom ...)
  - --start   : redémarrage des conteneurs
  - --ansible : déploiment arborescence ansible
  "
fi
