#!/bin/bash

file_weight() {

# Проверяем есть ли директория
  if [[ -d $1 ]]; then
      i=0
      c_size=0

# Проходим по файлам
        for file in $1/*; do
# Проверяем является ли file директорией или символьной ссылкой
                if [[ -d $file ]] || [[ -h $file ]]; then
                        continue
                fi
          ((i++))
          sizef=`stat -c "%s" $file`
          c_size=$(($c_size+$sizef))
        done

    echo "Общий размер файлов = $c_size"
    echo "Средний размер файла = $(($c_size/$i))"
  else
    echo "Такой директории не существует!"
  fi
}

file_weight $1
