#Convert tped to ped and reformat for use in parentage:
plink --tfile scaffold32 --recode tab --allow-extra-chr --out TEST/scaffold.32
paste names genos > formated_input.txt
