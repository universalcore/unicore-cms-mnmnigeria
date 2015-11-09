#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsmnmnigeria/locale

pot-create -o unicorecmsmnmnigeria/locale/unicorecmsmnmnigeria.pot unicorecmsmnmnigeria/

declare -a arr=("eng_GB")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsmnmnigeria/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsmnmnigeria/locale/""$lang""/LC_MESSAGES/unicorecmsmnmnigeria.po" ]; then
        msginit -l $lang -i unicorecmsmnmnigeria/locale/unicorecmsmnmnigeria.pot -o unicorecmsmnmnigeria/locale/$lang/LC_MESSAGES/unicorecmsmnmnigeria.po
    fi

    msgmerge --update unicorecmsmnmnigeria/locale/$lang/LC_MESSAGES/unicorecmsmnmnigeria.po unicorecmsmnmnigeria/locale/unicorecmsmnmnigeria.pot
    msgfmt unicorecmsmnmnigeria/locale/$lang/LC_MESSAGES/*.po -o unicorecmsmnmnigeria/locale/$lang/LC_MESSAGES/unicorecmsmnmnigeria.mo
done
