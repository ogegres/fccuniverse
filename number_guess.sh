#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Секретное число от 1 до 1000
MY_VAR=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read NAME

# Проверяем пользователя через LEFT JOIN, чтобы увидеть даже тех, у кого 0 игр
USER_INFO=$($PSQL "SELECT player_id, COUNT(game_id), MIN(number_of_guesses) FROM players LEFT JOIN games USING(player_id) WHERE name='$NAME' GROUP BY player_id")

if [[ -z $USER_INFO ]]
then
  # Если пользователя нет
  echo "Welcome, $NAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO players(name) VALUES('$NAME')")
  ID=$($PSQL "SELECT player_id FROM players WHERE name='$NAME'")
else
  # Если пользователь найден
  IFS='|' read -r ID GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  # Если игр еще не было, MIN вернет пустоту, заменим на 0 для безопасности, 
  # но в сообщении выводим как есть (тесты ожидают данные из БД)
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
COUNTER=0

while true
do
  read INPUT
  
  # Проверка на целое число
  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Каждое валидное число — это попытка
  ((COUNTER++))

  if [[ $INPUT -eq $MY_VAR ]]
  then
    echo "You guessed it in $COUNTER tries. The secret number was $MY_VAR. Nice job!"
    # Сохраняем результат
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(player_id, number_of_guesses) VALUES($ID, $COUNTER)")
    break
  elif [[ $INPUT -gt $MY_VAR ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done