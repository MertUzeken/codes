from turtle import *

length = int(input("Please define the size of the Star: "))
t = Turtle()
t.speed(5)

for i in range(5):
    t.fd(length)
    t.left(144)
