'''def subsetsum(set):
    if len(set) == 0:
        return set
    if (set[n - 1] > 0):
        return isSubsetSum(set, n - 1, 0);

    return isSubsetSum(set, n - 1, sum) or isSubsetSum(set, n - 1, sum - set[n - 1])
'''



def subset(set, num):
    result = []
    def find(st, num, path=()):
        if not st:
            return
        if st[0] == num:
            result.append(path + (st[0],))
        else:
            find(st[1:], num - st[0], path + (st[0],))
            find(st[1:], num, path)
    find(set, num)

    return result

def main():
    okbutthisisthelasttime = ([6,-5,4,-3,2,-1])
    okbutthisisthelasttime2= ([2,-3,5,8,11,23,-1])

    new = subset(okbutthisisthelasttime,0)

    if len(new) != 0:
        print('Yes', new)
    else:
        print('No')


main()