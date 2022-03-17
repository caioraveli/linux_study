#!/bin/bash

# Initialize the main array
export array_seq

# Create a function to split and organize the code
# We will use a flag to control if we will append the number in array or not
# We will use the linux $RANDOM variable to generate random numbers. Alternatively we could use shuf -i 1-10 -n 1
function generate_array(){
  control=0 
  num=$(echo $(( RANDOM % 10 + 1 ))) 
  array_seq+=(${num}) 
  # Control the array_seq length
  while [ "${#array_seq[*]}" -lt "10" ]
  do
    num=$(echo $(( RANDOM % 10 + 1 )))
    # Test if the random number already exists in the array_seq
    for n in ${array_seq[*]}
    do
      if [ "$num" -eq "$n" ]
      then
        control=0
        break
      else 
        control=1
      fi
    done
    # If control = 1, the random num will be appended in the array_seq
    if [ "$control " -eq "1" ]
    then
      array_seq+=(${num})
      control=0
    fi
  done
  echo ${array_seq[*]}

}

function main(){
  generate_array
}

main