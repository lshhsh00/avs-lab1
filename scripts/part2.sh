#!/bin/bash
# Часть 2: копирование, ссылки, объединение файлов, перемещение.

set -e
export LC_ALL=C.UTF-8
cd ~/lab0

# 1. Копия файла под новым именем
cp arcobaleno/kitchen/katya_recipe claude_monet/kitchen/new_recipe
# 2. Рекурсивная копия каталога (reviews_copy ещё не существует -> archive копируется под этим именем)
cp -r arcobaleno/archive claude_monet/chef_office/reviews_copy
# 3. Относительная символическая ссылка: путь цели считается от каталога, где лежит ссылка
ln -s ../kitchen/katya_recipe arcobaleno/office/chef_recipe
# 4. Символическая ссылка на каталог в корне lab0
ln -s arcobaleno/kitchen rival_kitchen
# 5. Жёсткая ссылка (без -s)
ln critic_visit claude_monet/tasting_room/critic_copy
# 6. Объединение двух файлов в новый (> перезаписывает/создаёт)
cat claude_monet/kitchen/old_menu arcobaleno/kitchen/italian_menu > claude_monet/tasting_room/menu_comparison
# 7. Дописать в конец (>> добавляет)
cat claude_monet/tasting_room/leva_comment >> critic_visit
# 8. Перемещение с переименованием
mv claude_monet/chef_office/barinov_notes claude_monet/tasting_room/chef_verdict

ls -lRi ~/lab0
cat claude_monet/tasting_room/critic_copy

git status
git add .
git commit -m "Часть 2: копии, символические и жёсткие ссылки, объединение файлов"
git push
