from turtle import *

xcoord = []
ycoord = []

point = 'P' #Ignore this .. please.

#Input the coordinates, I know no need for loops, but i wanted to try it out.
for i in range (0,3):
    print("Please give the x, y coordinates for P",i+1,":")
    x=int(input())
    xcoord.append(x)
    y=int(input())
    ycoord.append(y)


    if i == 0:
        up()
        goto(xcoord[0], ycoord[0])      #Move to given point0
        point += str(i)
        write(point)
        point = 'P'                     #Start Point

    elif i >= 1:
        down()
        goto(xcoord[i],ycoord[i])       #Move to given point i (1,2)
        point += str(i)
        write(point)
        point = 'P'                     #2 and 3 Point

#Conditions Check
if(xcoord[2] > xcoord[1] and xcoord[2] < xcoord[0] or xcoord[2] < xcoord[1] and xcoord[2] > xcoord[0]):
    print("P2 is between P0 and P1")
elif(xcoord[2] > xcoord[0] and xcoord[2] > xcoord[1]):
    print("P2 is on the right.")
else: 
    print("P2 is on the left.")

