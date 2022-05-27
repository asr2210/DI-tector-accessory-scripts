#!/bin/sh
for x in *_counts.txt;
do 
grep -P "(?<!= ).*Deletion DVG" $x > "$x"_deletioncounts.txt;
grep -P "(?<!= ).*Insertion DVG" $x > "$x"_insertioncounts.txt;
grep -P "(?<!= ).*3' cb" $x > "$x"_3primecbsb.txt;
grep -P "(?<!= ).*5' cb" $x > "$x"_5primecbsb.txt;
done

for f in *_deletioncounts.txt; do sed -i "s/$/\t$f/" $f; done
for f in *_insertioncounts.txt; do sed -i "s/$/\t$f/" $f; done
for f in *_3primecbsb.txt; do sed -i "s/$/\t$f/" $f; done
for f in *_5primecbsb.txt; do sed -i "s/$/\t$f/" $f; done


for d in *_counts.txt_*; do sed -i 's!_counts.txt_!!' $d; done

for d in *_deletioncounts.txt; do sed -i 's!deletioncounts.txt!!' $d; done
for d in *_insertioncounts.txt; do sed -i 's!insertioncounts.txt!!' $d; done
for d in *_3primecbsb.txt; do sed -i 's!3primecbsb.txt!!' $d; done
for d in *_5primecbsb.txt; do sed -i 's!5primecbsb.txt!!' $d; done

cat *_counts.txt_* > countsdata.txt

mkdir deletions && mv *_deletioncounts.txt deletions
mkdir insertions && mv *_insertioncounts.txt insertions
mkdir 3primecbsb && mv *_3primecbsb.txt 3primecbsb
mkdir 5primecbsb && mv *_5primecbsb.txt 5primecbsb

awk 'length($0)>55' countsdata.txt > tempcounts.txt && mv tempcounts.txt countsdata.txt
