#!/bin/bash
PREFIX=$1
INTERFACE=$2
SUBNET=$3
HOST=$4

#Проверка формата ввода подсети
re='^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

if ! [[ $PREFIX =~ $re ]] ; then
   echo "Неверный формат префикса!" >&2; exit 1
fi



if [[ $SUBNET == "" ]]; then

        if [[ $HOST == "" ]]; then

                for SUBNET in {1..255}
                do
                        for HOST in {1..255}
                        do
                                echo "[*] IP : "$PREFIX"."$SUBNET"."$HOST
                                arping -c 3 -i $INTERFACE $PREFIX"."$SUBNET"."$HOST 2> /dev/null
                        done
                done

        else
                for SUBNET in {1..255}
                do
                        echo "[*] IP : "$PREFIX"."$SUBNET"."$HOST
                        arping -c 3 -i $INTERFACE $PREFIX"."$SUBNET"."$HOST 2> /dev/null
                done
        fi

else

        if [[ $HOST == "" ]]; then

                for HOST in {1..255}
                do
                        echo "[*] IP : "$PREFIX"."$SUBNET"."$HOST
                        arping -c 3 -i $INTERFACE $PREFIX"."$SUBNET"."$HOST 2> /dev/null
                done
        else
                echo "[*] IP : "$PREFIX"."$SUBNET"."$HOST
                arping -c 3 -i $INTERFACE $PREFIX"."$SUBNET"."$HOST 2> /dev/null
        fi

fi
