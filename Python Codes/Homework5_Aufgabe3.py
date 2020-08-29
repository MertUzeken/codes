



#First comes the input.
#Used try and except for the ValueError event to intercept wrong inputs

while 1:
    try:
        inp = int(input("Please Enter an Integer ≥ 1"))
        if inp >= 1:
           break
    except ValueError:
        print("The given Value does not meet the requirement. Only Integers are allowed. Please try again.")

#Here Comes the body, it decrements every time by -1.

for body in range(inp,0,-1):
    for i in range (inp):   
        for j in range(i+1):
            print('*',end="")
        print()

    for g in range (inp-1,0,-1):
        for k in range(g):
            print('*', end="")
        print()
    inp -= 1
