

def countlist():
    list = [-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9]
    counter = 0
    for element in list:
        if element >= 0:
            counter += 1
    print("Number of positive numbers: " ,counter)



def main():
    countlist()
main()