numbers = int(input("Please enter a four digit integer: "))


while numbers>0:
    temp = numbers%10
    numbers -= temp
    numbers /= 10
    print(int(temp))
  


