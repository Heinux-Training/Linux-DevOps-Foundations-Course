#!/bin/bash

DISH_NAME="Spaghetti Carbonara"
PASTA_AMOUNT="500g"
SAUCE_TYPE="Creamy"


echo "Starting to prepare $DISH_NAME dish"
echo "Boiling $PASTA_AMOUNT  pasta"
echo "Mixing $SAUCE_TYPE Sauce Ingredients"

read -p "Add cheese to your dish? (true/false): " HAS_CHEESE
HAS_CHEESE=${HAS_CHEESE:-false}

if [ $HAS_CHEESE = "true" ]; then
  echo "Adding freshly grated cheese!"
else
  echo "No cheese, serving as is."
fi


serve_dish() {
  echo "$DISH_NAME is ready to serve!"
}

serve_dish