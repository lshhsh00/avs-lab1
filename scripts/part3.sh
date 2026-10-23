#!/bin/bash
# Часть 3: поиск и фильтрация, затем удаление.

set -e
export LC_ALL=C.UTF-8
cd ~/lab0

echo "=== 4.1 Пять самых больших обычных файлов (без 'copy') ==="
ls -lR ~/lab0 | grep '^-' | grep -v 'copy' | sort -k5 -nr | head -n 5

echo "=== 4.2 Строки с 'баринов' или 'катя', без 'десерт' ==="
grep -rhiE 'баринов|катя' claude_monet arcobaleno | grep -vi 'десерт' | sort | head -n 6

echo "=== 4.3 Число файлов с 'блюд' в обеих кухнях ==="
grep -l 'блюд' claude_monet/kitchen/* arcobaleno/kitchen/* | wc -l

echo "=== 4.4 Последние 2 строки *_menu, фильтр 'десерт|суп', обратная сортировка ==="
tail -q -n 2 claude_monet/kitchen/*_menu arcobaleno/kitchen/*_menu | grep -iE 'десерт|суп' | sort -r

echo "=== 4.5 Слов в первых 4 строках menu_comparison без 'десерт' ==="
grep -vi 'десерт' claude_monet/tasting_room/menu_comparison | sort -r | head -n 4 | wc -w

echo "=== 4.6 Обычные файлы с двумя жёсткими ссылками, по inode ==="
ls -lRi ~/lab0 | grep -E '^ *[0-9]+ -[^ ]+ +2 ' | sort -n

echo "=== 4.7 Строк с 'гост' или 'меню' без 'Елена' в reviews_copy ==="
grep -hiE 'гост|меню' claude_monet/chef_office/reviews_copy/* | grep -v 'Елена' | sort | wc -l

# --- 5. Удаление ---
rm arcobaleno/kitchen/katya_recipe
rm arcobaleno/office/chef_recipe
rm rival_kitchen                                  # без слэша на конце!
rm critic_visit                                   # данные живы, пока есть critic_copy
rm claude_monet/tasting_room/critic_copy
rm arcobaleno/archive/review_archive
rmdir arcobaleno/archive
rm -r claude_monet/chef_office/reviews_copy

ls -lR ~/lab0

git status
git add .
git commit -m "Часть 3: поиск и фильтрация, удаление файлов и каталогов"
git log --oneline
git push

