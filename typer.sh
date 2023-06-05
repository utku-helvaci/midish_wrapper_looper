#!/bin/bash
aseqdump -p "28:0" | \
while IFS=" ," read src ev1 ev2 ch label1 data1 label2 data2 rest1 rest2 rest3 rest4 rest5 rest6 vh rest7; do
echo read $read
echo src $src
echo ev1 $ev1
echo ch $ch
echo label1 $label1
echo data1 $data1
echo label2 $label2
echo data2 $data2
echo rest $rest1
echo vh $vh
done


exec 7>&1

coproc midish -v 1>&7 ;sleep 1;echo -e 'dnew 0 "28:0" rw'\\n'tnew rdx'\\n'fnew rdi'\\n'fmap {any {0 0}} {any {0 0}}'\\n'm off'\\n'loop'\\n'sel 4'\\n'r'\\n >&"${COPROC[1]}";echo something >&"${COPROC[1]}";sleep 1;echo something >&"${COPROC[1]}"
