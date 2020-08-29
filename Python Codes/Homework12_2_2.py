def composite(dict1, dict2):
    d =  {k1:dict2[dict1[k1]] for k1 in dict1 if dict1[k1] in dict2}
    return d


def main():
    dict1 = {'a':'p','b':'r','c':'q','d':'p','e':'s'}
    dict2 = {'p':'1','q':'2','r':'3'}

    print(composite(dict1,dict2))

main()