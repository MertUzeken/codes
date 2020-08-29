def split(x):
    notes = [1000,500,100,50,20,10,5,2,1]
    temp = [0,0,0,0,0,0,0,0,0]

    for i, j in zip(notes, temp): 
        if x >= i: 
            j = x // i 
            x = x - j * i
            if i > 20:
                print(i,"Baht note:",j)
            elif i <= 20:
                print(i,"Baht coin:",j)

def main():
    while True:
        x = int(input("Input your amount of money: "))
        split(x)

main()

