#!/usr/bin/env bash
# Teste visual de ~50 s: cores, rainbow e reactive. Digite algo num editor enquanto roda.
cd "$(dirname "${BASH_SOURCE[0]}")/../Build" || exit 1
G="dotnet GK6X.dll"
$G daemon >/dev/null 2>&1 &
DPID=$!
trap '$G stop >/dev/null 2>&1; wait $DPID 2>/dev/null' EXIT
sleep 3
echo "vermelho";  $G color ff0000; sleep 6
echo "verde";     $G color 00ff00; sleep 6
echo "azul";      $G color 0000ff; sleep 6
echo "rainbow";   $G effect rainbow --speed 70; sleep 12
echo "reactive (aperte teclas)"; $G effect reactive --color ffffff --color2 100030; sleep 12
echo "fim"
