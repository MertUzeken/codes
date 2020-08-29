
def get_difference(list1,list2):
    return (print(set(list1) ^ set(list2)))


def main():
    list1 = [3,1,1,1,2,7]
    list2 = [4,1,1,2,2,5]
    print(get_difference(list1,list2))
main()