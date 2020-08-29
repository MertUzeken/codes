def texteses(s):
    sentence = s.split()
    dict = {'be':'b','because':'cuz','see':'c','the':'da','okay':'ok'}
    index = 0
    for word in sentence:
        index +=1
        for element in dict:
            if element == word:
                sentence[index-1] = dict[element]

    newstring = ' '.join(sentence)
    return newstring

def untexteses(s):
    sentence = s.split()
    dict = {'be':'b','because':'cuz','see':'c','the':'da','okay':'ok'}
    index = 0
    for word in sentence:
        index +=1
        for element in dict:
            if element == word:
                sentence[index-1] = element

    newstring = ' '.join(sentence)
    return newstring


def main():
    somestring = 'okay but this is the last time okay'
    print(somestring)               #Original
    print(texteses(somestring))     #Abbrevations
    print(untexteses(somestring))   #Unabbrevations

main()