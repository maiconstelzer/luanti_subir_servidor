#!/bin/bash

function menu {
   mundos=(/home/mds/.minetest/worlds/*)
   clear

   i=0
   titulo='Mundos disponíveis para abrir o servidor:'
   linha="${titulo//?/-}"
   echo $titulo
   echo $linha
   
   for w in ${mundos[@]}; do
      nome=$(basename $w)
      echo "$i - $nome"
      (( i = i + 1 ))
   done
   
   echo $linha

   read -p 'Selecione uma opção: ' opcao

   if [[ ! -z $opcao ]]; then
      luantiserver --world ${mundos[$opcao]} --port 30000
   fi

   menu
}

menu
