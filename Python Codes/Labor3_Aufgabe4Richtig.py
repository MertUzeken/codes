from turtle import *

x = int(input("Input:"))
t = Turtle()
t.speed(4)

for i in range(2):
    t.fd(x)
    t.right(90)
    t.fd(x*0.5)
    t.right(90)

t.right(90)
t.fillcolor('red')
t.begin_fill()

for i in range(2):
    t.fd(x * 0.075)
    t.left(90)
    t.fd(x)
    t.left(90)
t.end_fill()
t.fd(x/2)
t.left(90)
t.fillcolor('red')
t.begin_fill()

for i in range(2):
    t.fd(x)
    t.left(90)
    t.fd(x * 0.075)
    t.left(90)


t.end_fill()
t.left(90)
t.fd(x * 0.15)
t.right(90)
t.fillcolor('blue')
t.begin_fill()
t.fd(x)
t.left(90)
t.fd(x * 0.2)

t.left(90)
t.fd(x)
t.left(90)
t.fd(x * 0.2)
t.end_fill()
