def check(s,t):
    if len(s) == 0:
        return False
    elif s[0] == t:
        return True
    return check(s[1:],t)



def main():
    a = [1,2,3]
    val = 0
    print(check(a,val))
main()