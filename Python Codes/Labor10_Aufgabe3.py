def remover(list):
    del list[2::3]
    print(list)

def main():
    list = [3,6,6,3,7,2,0,1,5,4]
    remover(list)
main()