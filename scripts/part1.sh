#!/bin/bash
# Часть 1: git init, дерево каталогов и файлов, права доступа, первый коммит и push.
# Вариант 4 (ИСУ 561393: 561393 mod 15 + 1 = 4).

set -e                      # остановиться на первой ошибке
export LC_ALL=C.UTF-8       # кириллица для grep -i и sort

# Удалённый репозиторий на GitHub.
REPO_URL="https://github.com/lshhsh00/avs-lab1.git"

# --- 1. Репозиторий ---
mkdir ~/lab0
cd ~/lab0
git init -b main

# --- 2. Дерево каталогов ---
mkdir claude_monet
mkdir claude_monet/kitchen claude_monet/chef_office claude_monet/tasting_room
mkdir arcobaleno
mkdir arcobaleno/kitchen arcobaleno/office arcobaleno/archive

# --- Файлы с содержимым ---
cat > claude_monet/kitchen/old_menu << 'EOF'
Утиная ножка от Виктора Баринова
Луковый суп Claude Monet
Фирменный салат от шефа
Десерт Луи с карамелью
EOF

cat > claude_monet/kitchen/duck_recipe << 'EOF'
Подготовить утиную ножку
Добавить овощи и соус от Баринова
Перед подачей проверить температуру
EOF

cat > claude_monet/chef_office/barinov_notes << 'EOF'
Не повторять блюда конкурентов
Катю допустить к общей дегустации
Лёва записывает замечания шефа
Последнее решение принимает Баринов
EOF

cat > claude_monet/tasting_room/tasting_scores << 'EOF'
Блюдо Баринова получило девять баллов
Паста Кати получила восемь баллов
Десерт Луи получил десять баллов
EOF

cat > claude_monet/tasting_room/leva_comment << 'EOF'
Лёва проверил порядок подачи блюд
Меню обоих ресторанов готово к сравнению
Результаты переданы Виктору Петровичу
EOF

cat > arcobaleno/kitchen/italian_menu << 'EOF'
Домашняя паста от Елены Павловны
Ризотто с белыми грибами
Итальянский рыбный суп
Десерт по рецепту Кати
EOF

cat > arcobaleno/kitchen/katya_recipe << 'EOF'
Катя приготовила молекулярную закуску
Для блюда использованы знакомые продукты
Елена Павловна одобрила новую подачу
EOF

cat > arcobaleno/office/elena_plan << 'EOF'
Елена Павловна встречает критика
Катя представляет новое блюдо
Команда Arcobaleno готовит итальянское меню
EOF

cat > arcobaleno/archive/review_archive << 'EOF'
Критик похвалил пасту в прошлый визит
Гости отметили спокойную работу кухни
Елена сохранила отзыв для нового меню
EOF

cat > critic_visit << 'EOF'
Ресторанный критик посетит оба ресторана
Сначала он зайдёт в Claude Monet
После этого отправится в Arcobaleno
EOF

ls -lR ~/lab0

# --- 3. Права доступа ---
# Число -> числовой способ, буквы/слова -> символьный способ.
chmod 644 claude_monet/kitchen/old_menu
chmod u=rw,g=r,o= claude_monet/kitchen/duck_recipe
chmod 600 claude_monet/chef_office/barinov_notes
chmod 640 claude_monet/tasting_room/tasting_scores
chmod u=r,g=r,o= claude_monet/tasting_room/leva_comment
chmod 644 arcobaleno/kitchen/italian_menu
chmod u=rw,g=r,o= arcobaleno/kitchen/katya_recipe
chmod u=r,g=r,o= arcobaleno/office/elena_plan
chmod 640 arcobaleno/archive/review_archive
chmod u=rw,g=r,o=r critic_visit

chmod u=rwx,g=rx,o=rx claude_monet
chmod 750 claude_monet/kitchen
chmod 710 claude_monet/chef_office
chmod u=rwx,g=rwx,o= claude_monet/tasting_room
chmod 755 arcobaleno
chmod u=rwx,g=rx,o= arcobaleno/kitchen
chmod 750 arcobaleno/office
chmod u=rwx,g=rx,o= arcobaleno/archive

ls -lR ~/lab0

# --- 4-5. Коммит и публикация ---
git status
git add .
git commit -m "Часть 1: дерево каталогов и файлов, права доступа"
git log --oneline
git remote add origin "$REPO_URL"
git push -u origin main
