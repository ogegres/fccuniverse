#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN(){
  if [[ $1 ]]
  then
    echo -e "$1 What would you like today?"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  SERVICES="$($PSQL "SELECT * FROM services")"
  NUMBER_OF_SERVICES="$($PSQL "SELECT COUNT(*) FROM services")"
  echo $SERVICES | sed 's/ /\n/g; s/|/) /g'
  read SERVICE_ID_SELECTED

  if [[ $SERVICE_ID_SELECTED -gt 0 && $SERVICE_ID_SELECTED -le $NUMBER_OF_SERVICES ]]
  then
    ASK_NUMBER
  else
    MAIN "\nI could not find that service."
  fi
}
ASK_NUMBER(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CHECK_NUMBER="$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")"
  if [[ ! $CUSTOMER_PHONE == $CHECK_NUMBER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')">/dev/null
    CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    #insert new record
  else
    CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    #read name from db
  fi
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  #new appointment
  $PSQL "INSERT INTO appointments(customer_id, time, service_id) VALUES($CUSTOMER_ID, '$SERVICE_TIME' ,$SERVICE_ID_SELECTED)" >/dev/null
}

MAIN