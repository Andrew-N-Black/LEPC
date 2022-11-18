
for i in `ls -1 *ROH.txt`; do python ROHparser.py $i > ${i}_results.txt ; done

cat *_results.txt | grep "F(ROH)" | cut -d " " -f 4| cut -f 1 > 100kb

cat *_results.txt | grep "F(ROH)" | cut -d " " -f 7| cut -f 1 > 1MB

