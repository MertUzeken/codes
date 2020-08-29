def print_table(list1,list2):
    for i in list1:
        print(i)
    for j in list2:
        print(j)


def main():

    l = [["ID ","NAME ","SURNAME "],
        ["001","Guido","van Rossum"],
        ["002","Donald","Knuth"],
        ["003","Gordon","Moore"]]

    l2 = [["X","Y "],
          ["0, 0"],
          ["10, 10"],
          ["200, 200"]]
    
    print_table(l,l2)

main()
