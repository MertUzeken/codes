"""def find_duplicates(f):
    list1=[]
    for key,value in f.items():
        for i in value:
            if i ==

    return list1"""

def is_subset(sub,sup):

    print(sub.issubset(sup))

def inverse(dict):
    list1 = list(dict.values())
    list2 = list(dict)
    newdict = {}
    newset = set()
    a= 0
    for i in list1:
        b = 0
        for k in list1:
            if k == i:
                newset.add(list2[b])
            b+=1
        newdict[i] = newset
        a+= 1
        newset = set()
    print(newdict)

def main():

   # dict1={'s5301':'Fred','s5302':'Harry','s5303':'john','s5304':'Fred','5305':'Harry'}
   # print(find_duplicates(dict1))
  # sup = set([1,2,3,4])
  # sub = set([1,2,3,7])
  # is_subset(sub,sup)
    dict = {'a':'1','b':'2','c':'1','d':'3','e':'1','f':'2',}
    inverse(dict)

main()