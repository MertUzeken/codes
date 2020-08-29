from turtle import *

month =["","January","February","March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
days =["","Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
leapyear = False

#Check if leap year


def leapyear(year = 2018):  
    if (year % 4 == 0) and (year % 100 != 0) or (year % 400 == 0):
        print(year , " is a leap year")
        leap = True
    else:
         print(year , " is not a leap year")
         leap = False
    return(leap)

def firstoftheyear(year):
    first = (


year = int(input("Please Enter the current year: "))    
leapyear = leapyear(year)
print(firstoftheyear(year))

