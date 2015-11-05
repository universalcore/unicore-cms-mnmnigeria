#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsconnectsmart/locale

pot-create -o unicorecmsconnectsmart/locale/unicorecmsconnectsmart.pot unicorecmsconnectsmart/

declare -a arr=("eng_GB")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsconnectsmart/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsconnectsmart/locale/""$lang""/LC_MESSAGES/unicorecmsconnectsmart.po" ]; then
        msginit -l $lang -i unicorecmsconnectsmart/locale/unicorecmsconnectsmart.pot -o unicorecmsconnectsmart/locale/$lang/LC_MESSAGES/unicorecmsconnectsmart.po
    fi

    msgmerge --update unicorecmsconnectsmart/locale/$lang/LC_MESSAGES/unicorecmsconnectsmart.po unicorecmsconnectsmart/locale/unicorecmsconnectsmart.pot
    msgfmt unicorecmsconnectsmart/locale/$lang/LC_MESSAGES/*.po -o unicorecmsconnectsmart/locale/$lang/LC_MESSAGES/unicorecmsconnectsmart.mo
done
