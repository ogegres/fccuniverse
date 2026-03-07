#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ARG=$1

NO_ITEM(){
  echo "I could not find that element in the database."
  exit
}

MAIN(){
  if [[ -z $ARG ]]
  then
    echo "Please provide an element as an argument."
    exit
  fi
  if [[ $ARG =~ [0-9] ]]
  then
    NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number=$ARG")"
    if [[ ! -z $NAME ]]
    then
      IFS='|' read -r NUMBER SYMBOL MASS MELTP BOILP TID TYPE <<< "$($PSQL "SELECT atomic_number, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id, type  FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number=$ARG")" 
      echo -e "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
      exit
    fi
  fi  
  if [[ ${#ARG} -gt 2 ]]
  then
    NAME="$($PSQL "SELECT name FROM elements WHERE name='$ARG'")"
    if [[ ! -z $NAME ]]
    then
      IFS='|' read -r NUMBER SYMBOL MASS MELTP BOILP TID TYPE <<< "$($PSQL "SELECT atomic_number, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id, type  FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE name='$ARG'")" 
      echo -e "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
      exit
    fi
  fi
  if [[ ${#ARG} -le 2 ]]
  then
    NAME="$($PSQL "SELECT name FROM elements WHERE symbol='$ARG'")"
    if [[ ! -z $NAME ]]
    then
      IFS='|' read -r NUMBER SYMBOL MASS MELTP BOILP TID TYPE <<< "$($PSQL "SELECT atomic_number, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id, type  FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE symbol='$ARG'")" 
      echo -e "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
      exit
    fi
  fi
  NO_ITEM
}
MAIN
