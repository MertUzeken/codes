def merge(list1,list2):
    union = list1 + list2
    #union.sort()
    return union

def main():
    l1 = []
    l2 = []

    while True:
        x = str(input("Enter list1: "))
        l1.append(x)
        if l1[len(l1)-1] == "":
            break
    del l1[-1]
    while True:
        x = str(input("Enter list2: "))
        l2.append(x)
        if l2[len(l2)-1] == "":
            break
    del l2[-1]
    print(merge(l1,l2))


main()