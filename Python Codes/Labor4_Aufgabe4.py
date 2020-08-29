su= 0

for i in range (0,5):
    number = int(input("Enter an integer: "))

    if number > 0:
        su += number
        print("Current sum: ", su)
    elif number < 0:
        if su < 0:
            su = su + number
            print("Current sum: ", su)
        elif number < 0:
            su = 0
            su +=number
            print("Current sum: ", su)
