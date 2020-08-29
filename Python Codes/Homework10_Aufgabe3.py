def merge(list1,list2):
    union = list1 + list2
    n = []
    #Remove dublicates
   

def intersection(list1,list2):
    intersection = set(list1) & set(list2)
    return intersection

def difference(list1, list2):
    difference = set(list1) - set(list2)
    return difference


def main():
    l1 = [3,1,2,7]
    l2 = [4,1,2,5]

    union   = merge(l1,l2)
    intrsct = intersection(l1,l2)
    diff    = difference(l1,l2)

    print("L1 = ", l1)
    print("L2 = ", l2)
    print("")
    print("Union of l1 and l2", union)
    print("Intersection of l1 and l2", intrsct)
    print("Difference of l1 and l2", diff)
    
    


main()
