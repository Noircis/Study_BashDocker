#!/bin/bash

#si option == --create
if [ "$1" == "--create" ]; then
  echo "executing --create"

  nb_machine=1
  [ "$2" != "" ] && nb_machine=$2

  docker run -tid --name $USER-alpine alpine:latest

  echo "created $2 docker(s)"

#si option == --drop
elif [ "$1" == "--drop" ]; then
  echo "executing --drop"

  docker rm -f $USER-alpine

#si option == --infos
elif [ "$1" == "--infos" ]; then
  echo "executing --infos"

#si option == --start
elif [ "$1" == "--start" ]; then
  echo "executing --start"

#si option == --ansible
elif [ "$1" == "--ansible" ]; then
  echo "executing --ansible"

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
