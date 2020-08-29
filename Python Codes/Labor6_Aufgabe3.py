from turtle import *
speed(8)


def draw_square(x):
    for i in range (1,5):
        for j in range(4):
            draw(x*i)

def draw(x):
        for i in range (4):
            forward(x/2)
            left(90)
        right(90)




val = int(input("Input : "))
draw_square(val)
