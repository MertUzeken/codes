def translator(x):
    #Dictionary
    single_digit = ["Zero","One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    two_digit = ["Twenty","Thirty","Fourty","Fifty","Sixty","Seventy","Eighty","Ninety"]
    special_case = ["Eleven", "Twelve", "Thirteen","Fourteen","Fifteen","Fixteen","Seventeen","Eighteen","Nineteen","Hundred"]
    if x <= 10:
        print(single_digit[x])
    elif x>10 and x < 20:
        x = digit_cutter(x)
        print(special_case[x-1])
    elif x >= 20 and x < 100:
        if x%10 == 0:
            x,y = digit_cutter(x)
            print(two_digit[x-2])
        else:
            x,y = digit_cutter(x)
            print(two_digit[x-2], " - " ,single_digit[y])
    elif x >= 100 and x <= 110:
        if x % 10 == 0:
            x,y,z = digit_cutter(x)
            print(single_digit[x],special_case[9], "and", single_digit[10])
        else:
            x,y,z = digit_cutter(x)
            print(single_digit[x],special_case[9], "and",single_digit[z])
    elif x > 110 and x < 120:
        x,y,z = digit_cutter(x)
        print(single_digit[x],special_case[9], "and", special_case[z-1])
    elif x > 120 and x < 1000:
        x,y,z = digit_cutter(x)
        print(single_digit[x],special_case[9], "and", two_digit[y-2], single_digit[z])
    else:
        print("N/A")
        
def digit_cutter(x):
    if x < 20:
        x = str(x)
        x = x[1]
        x = int(x)
        print(x)
        return x
    elif x >= 20 and x < 100:
        x = str(x)
        t1 = x[0]
        t2 = x[1]
        x = int(t1)
        y = int(t2)
        print(x,y)
        return [x,y]
    elif x > 100:
        x = str(x)
        t1 = x[0]
        t2 = x[1]
        t3 = x[2]
        x = int(t1)
        y = int(t2)
        z = int(t3)
        print(x,y,z)
        return [x,y,z]

while True:
    val = int(input("Please Enter an Integer ranging from 0 - 999"))
    translator(val)

#Quick Comment: I am aware of ways to shorten the code even further, but I dont have the time, so I'll leave
#as it is. Since the task is completed.
