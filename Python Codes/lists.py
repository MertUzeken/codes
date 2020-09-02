#   This is a short code snippet for merging/concatenating two lists of -
#   different sizes and content. 
#   Goal: Merging two lists without duplicates.

from heapq import merge
from operator import concat

list1 = [3,4,5,6,7,8,9,1,2,0]
list2 = [11,12,13,4,5,14]
differences = []
for item1 in list1:
    for item2 in list2:
        if item2 not in differences and item2 not in list1:
            differences.append(item2)

print(differences)

Zootiere = ["Tiger", "Giraffe", "Affe", "Loewe", "Vogel", "Nilpferd"]
Wildtiere = ["Wolf", "Fuchs", "Wildschwein", "Reh", "Schlange"]
Alletiere = []

Alletiere = concat(Zootiere,Wildtiere)

print(list(merge(Zootiere,Wildtiere)))
