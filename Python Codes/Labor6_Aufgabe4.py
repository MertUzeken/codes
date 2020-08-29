from turtle import *

def draw_pol(x,y,sides=4,size=100):
    penup()
    goto(x,y)
    pendown()
    circle(size,360,sides)


    
draw_pol(0,0,size = 50)
