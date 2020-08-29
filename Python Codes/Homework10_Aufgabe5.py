def isAnagram(String1,String2):
    if(sorted(String1)== sorted(String2)): 
        return "is Anagram"  
    else: 
        return "is not Anagram"

def main():
    s1= str(input("Please give string one"))
    s2= str(input("Please give string two"))
    print(isAnagram(s1,s2))

main()
