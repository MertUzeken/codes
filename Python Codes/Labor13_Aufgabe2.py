def list_reverse(a):
    if not a:
        return []
    return a[-1:] + list_reverse(a[:-1])

# START:STOP:STEP
def main():
    aLIST = [1,2,3]
    print(list_reverse(aLIST))
main()