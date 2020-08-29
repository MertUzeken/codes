def my_sort(list):
    for element in range(len(list) - 1, 0, -1):
        for i in range(element):
            if list[i] > list[i + 1]:
                temp = list[i]
                list[i] = list[i + 1]
                list[i + 1] = temp
    return list

def main():
    L = []
    while True:
        x = input("Enter Val: ")
        L.append(x)
        if L[len(L)-1] == "":
            break
    del L[-1]
    print(my_sort(L))
main()