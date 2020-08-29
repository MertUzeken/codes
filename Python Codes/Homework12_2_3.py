
def product(*args):
    newset = []
    sum = 1
    queue = 0
    for k in range(len(args)):
        sum *= len(args[k])
    lenght = sum / len(args[0])
    for i in args[0]:
        for k in range(int(lenght)):
            newset.append(set([i]))
    while lenght > 0:
        for k in range(1, len(args)):
            lenght = lenght / len(args[k])
            for j in range(int(sum)):
                if queue == len(tuple(args[k])):
                    queue = 0
                newset[j].add(tuple(args[k])[queue])
                queue += 1
    return newset


def main():
    s1 = set([1,2,3])
    s2 = set(['p','q'])
    s3 = set(['a','b','c'])
    newset = product(s1,s2)

main()




