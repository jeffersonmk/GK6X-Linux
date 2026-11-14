#!/usr/bin/env bash
# Descobre qual variação do frame acende o teclado. Observe o teclado e anote os nomes (A, B, C, D) que acenderam.
cd "$(dirname "${BASH_SOURCE[0]}")/../Build" || exit 1
G="dotnet GK6X.dll probe --color ff0000 --seconds 5"
echo ">>> A: alpha 255";                       $G --alpha 255 | grep -E "Frames|NO ANSWER"; sleep 2
echo ">>> B: alpha 255 + config do driver";     $G --alpha 255 --le-config | grep -E "Frames|NO ANSWER"; sleep 2
echo ">>> C: alpha 255 sem tabela de teclas";   $G --alpha 255 --driver-keys none | grep -E "Frames|NO ANSWER"; sleep 2
echo ">>> D: alpha 0 + config do driver";       $G --alpha 0 --le-config | grep -E "Frames|NO ANSWER"
echo "fim"
