#!/bin/bash

if [[ $1 =~ ^-?[0-9]+$ ]] 
then
echo "err, parametr is a number."
else
echo "Your input: $1"
fi