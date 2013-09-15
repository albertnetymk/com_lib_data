#!/bin/bash
for d in *; do
    if [ -d $d ]; then
        echo $d
        cd $d
        # cat /dev/null > ${d}.txt
        # for v in 1 2 3; do
        #     for bz in 10 100 200; do
        #         if [ -f v${v}_${bz}.m ]; then
        #             octave -q v${v}_${bz}.m >> ${d}.txt
        #         fi
        #     done
        # done
        # perl ../test.pl ${d}.txt > unzip.txt
        # lines=$(cat unzip.txt | wc -l)
        # half=$(( $lines / 2 ))
        # head -n $half unzip.txt > mean.txt
        # tail -n $half unzip.txt > std.txt
        if [[ $(( $(cat mean.txt | wc -l)/3 )) -eq 2 ]]; then
            # echo '| |100|200|'
            echo '| |100|200|' > table.md
            echo '|---|---|---|' > table.md
            perl ../table_2.pl mean.txt >> table.md
            perl ../table_2.pl std.txt >> table.md
        else
            # echo '| |10|100|200|'
            echo '| |10|100|200|' > table.md
            echo '|---|---|---|---|' > table.md
            perl ../table_3.pl mean.txt >> table.md
            perl ../table_3.pl std.txt >> table.md
        fi

        cd ..
    fi
done
