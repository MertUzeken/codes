from turtle import *

centerx = int(input("Please input the x coord.Center of the circle"))
centery = int(input("Please input the y coord.Center of the circle"))
radius = int(input("Please input the Radius of the circle"))
shape('blank')
up()
goto(centerx,centery)
down()
circle(radius,360)
