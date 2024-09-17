#!/bin/bash

# Проверяем, что скрипт запущен в корневой директории, где находятся папки ex00 - ex10
for i in {00..10}
do
  # Формируем имя папки и файла
  folder="ex0$i"
  old_file="day02_ex0$i.sql"
  new_file="day03_ex0$i.sql"

  # Проверяем, существует ли папка и файл
  if [ -d "$folder" ] && [ -f "$folder/$old_file" ]; then
    # Переименовываем файл
    mv "$folder/$old_file" "$folder/$new_file"
    echo "Переименован $folder/$old_file в $folder/$new_file"
  else
    echo "Папка $folder или файл $folder/$old_file не найдены"
  fi
done