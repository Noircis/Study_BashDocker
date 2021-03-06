#!/bin/bash

###############################################################
#
# Desc : déploiment de conteneurs docker
#
# Auth : Noircis (tutored by xavki)
#
# Date : 12 Juin 2022
#
###############################################################

#si option == --create
if [ "$1" == "--create" ]; then

  # def nb de conteneurs
  nb_machine=1
  [ "$2" != "" ] && nb_machine=$2

  # set min/max
  min=1
  max=0

  # récup de l'id max
  idmax=`docker ps -a --format '{{ .Names}}' | awk -F "-" -v user=$USER '$0 ~ user"-alpine" {print $3}' | sort -r | head -1`

  #redef de min/max
  min=$(($idmax + 1))
  max=$(($idmax + $nb_machine))

  #creation des conteneurs
  for i in $(seq $min $max); do
    docker run -tid --name $USER-alpine-$i alpine:latest
    echo "created $USER-alpine-$i"
  done

#si option == --drop
elif [ "$1" == "--drop" ]; then
  echo "deleting..."
  docker rm -f $(docker ps -a | grep $USER-alpine | awk '{print $1}')

#si option == --infos
elif [ "$1" == "--infos" ]; then
  echo "Information des conteneurs : "
  for conteneur in $(docker ps -a | grep $USER-alpine | awk '{print $1}'); do
    docker inspect -f ' => {{.Name}} - {{.NetworkSettings.IPAddress }}' $conteneur
  done

#si option == --start
elif [ "$1" == "--start" ]; then
  echo "starting ..."
  docker start $(docker ps -a | grep $USER-alpine | awk '{print $1}')

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
