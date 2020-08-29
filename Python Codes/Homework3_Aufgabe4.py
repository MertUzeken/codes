from turtle import *

size = int(input("Please type in the size of the rings (radius): "))

speed(20)

ringcolor = ["blue", "black", "red", "yellow", "green"]
space = 0

for i in range (0, 3):
    down()
    color(ringcolor[i])
    circle(size)
    space += size*2.2
    up()
    goto(space,0)

goto(0,(size*-1.5))
color(ringcolor[4])
forward(space/2)
down()
circle(size)

up()
color(ringcolor[3])
bk(space/3)
down()
circle(size)
