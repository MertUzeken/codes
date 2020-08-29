def sum_of_digits(x):
    temp = 0
    while x:
        temp += (x % 10)
        x //= 10
    return temp



val = int(input("Please Enter an Integer"))
print(sum_of_digits(val))
