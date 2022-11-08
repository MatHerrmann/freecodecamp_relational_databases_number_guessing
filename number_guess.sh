#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -t --no-align -c "

echo "Enter your username:"
read USER_NAME


SELECT_USER_NAME_RESULT=$($PSQL "SELECT name FROM users WHERE name='$USER_NAME'")
if [[ -z $SELECT_USER_NAME_RESULT ]]; then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_SCORE=2147483647
  $PSQL "INSERT INTO users(name, games_played, best_score) VALUES('$USER_NAME', $GAMES_PLAYED, $BEST_SCORE)" >/dev/null
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$USER_NAME'")
  BEST_SCORE=$($PSQL "SELECT best_score FROM users WHERE name='$USER_NAME'")
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
fi
RAN_NUMBER=$((1 + $RANDOM % 1000))
NEEDED_GUESSES=0
echo "Guess the secret number between 1 and 1000:"
while :
do 
  NEEDED_GUESSES=$((NEEDED_GUESSES + 1))
  read GUESSED_NUMBER
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]*$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  if [[ $GUESSED_NUMBER -gt $RAN_NUMBER ]]; then
    echo "It's lower than that, guess again:"
    continue
  elif [[ $GUESSED_NUMBER -lt $RAN_NUMBER ]]; then
    echo "It's higher than that, guess again:"
    continue
  else
    echo "You guessed it in $NEEDED_GUESSES tries. The secret number was $RAN_NUMBER. Nice job!"
    break
  fi
done

if [[ $NEEDED_GUESSES -lt $BEST_SCORE ]]; then
  BEST_SCORE=$NEEDED_GUESSES
fi
GAMES_PLAYED=$((GAMES_PLAYED + 1))
$PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_score=$BEST_SCORE WHERE name='$USER_NAME'">/dev/null
