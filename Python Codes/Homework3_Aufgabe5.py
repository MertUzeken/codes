from turtle import *
startx = 0
starty = 0

xcoord = []
ycoord = []

for i in range (0,3):
    print("Please give the x,y coordinates for P",i+1,":")
    x=int(input())
    xcoord.append(x)
    y=int(input())
    ycoord.append(y)
    
    if i>=1:
        down()
        setheading(towards(x,y))
        forward(100)
    if i==0:
        up()
        startx=x
        starty=y
        goto(x,y)
        
goto(startx,starty)
area = abs(xcoord[0]*(ycoord[1]-ycoord[2])+xcoord[1]*(ycoord[2]-ycoord[0])+xcoord[2]*(ycoord[0]-ycoord[1])) **0.5
write(area)

