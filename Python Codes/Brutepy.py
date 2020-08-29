import timeit


def brute_number(target):
    val = 0
    while True:
        val += 1
        if target == val:
            print("Match found")
            print(val)
            break
        elif val > 10**60:
            print("First run complete, not matches up to 10^50")

def brute_letter(target):
    letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    for a in letters:
        for b in letters:
            for c in letters:
                for d in letters:
                    if (a+b+c+d) == target:
                        print("match found")
                        print(a+b+c+d)
                        break

def brute_force(target):
    #Dictionary
    y = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",".",",","-","@","#","!","?"]
    for a in y:
        if (a) == target:
            return a
            break       
        for b in y:
            if (a+b) == target:
                return a+b
                break
            for c in y:
                if (a+b+c) == target:
                    return a+b+c
                    break
                for d in y:
                    if (a+b+c+d) == target:
                            return a+b+c+d
                            break
                    for e in y:
                        if (a+b+c+d+e) == target:
                            return a+b+c+d+e
                            break
                       
def main():
    x = str(input("String: "))
    start_time = timeit.default_timer()
    y = brute_force(x)
    print("The runtime is {:0.2f} sec for bruteforcing via string comparison".format(timeit.default_timer() - start_time))
    print(y)
main()
