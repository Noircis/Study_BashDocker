#!/bin/bash

#si option == --create
if [ "$1" == "--create" ]; then

  # def du nb de conteneurs
  nb_machine=1
  [ "$2" != "" ] && nb_machine=$2
  #creation des conteneurs
  for i in $(seq 1 $nb_machine); do
    docker run -tid --name $USER-alpine-$i alpine:latest
    echo "created $USER-alpine-$i"
  done


#si option == --drop
elif [ "$1" == "--drop" ]; then
  echo "deleting..."
  docker rm -f $(docker ps -a | grep $USER-alpine | awk '{print $1}')

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
