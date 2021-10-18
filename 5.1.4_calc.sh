#!/bin/bash

re='^[0-9]+([.][0-9]+)?$'

echo -n "Введите 1е число: "
read aa


if ! [[ $aa =~ $re ]] ; then
   echo "Это не число!" >&2; exit 1
fi


echo -n "Введите 2е число: "
read bb

if ! [[ $aa =~ $re ]] ; then
   echo "Это не число!" >&2; exit 1
fi

select act in "+" "-" "*" "/"; do

        echo "Результат:"

        case $act in
        "+")
#               echo "Сложение"
                echo $(bc<<<"scale=3;$aa+$bb")
                ;;
        "-")
#               echo "Вычитание"
                echo $(bc<<<"scale=3;$aa-$bb")
                ;;
        "*")
#               echo "Умножение"
                echo $(bc<<<"scale=3;$aa*$bb")
                ;;
        "/")
#               echo "Деление"
                echo $(bc<<<"scale=3;$aa/$bb")
                ;;
        esac

        break

done
