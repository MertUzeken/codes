def reverse_integer(x):
    x = str(x)
    for i in reversed(x):
        print(i,end =" ")
        
def main():
    x = int(input("Please Enter an Integer value"))
    reverse_integer(x)

main()


