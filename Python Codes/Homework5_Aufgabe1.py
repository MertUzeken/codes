while 1:
    try:
        n = int(input("Please Enter the number whom square root is needed"))
        break
    except ValueError:
        print("The given Value does not meet the requirement. Only Integers are allowed. Please try again.")

guess = (n/2)
temp = float(0)

result = []

for a in range (5,8):  #Repetition a = nr. 5 , 6 , 7
    for b in range (a): 
        temp  = n/guess
        guess = (guess + temp)/2
       
        
    print("Root for ", a, " try: :{:0.3f}".format(guess))
    result.append(guess) 
    guess = (n/2)
    temp = float(0)

if result[0] == result[1] and result[1] == result[2]:
    print("The Approximate results of repetition 5,6,7 are all equal")
else:
    print("The Approximate results of repetition 5,6,7 are not equal")
