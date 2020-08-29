

def name_list():
    list = []

    while True:
        x = str(input("Enter Name: "))
        list.append(x)
        if list[len(list)-1] == "":
            for elements in list:
                print(elements)
            break



def main():
    name_list()
main()