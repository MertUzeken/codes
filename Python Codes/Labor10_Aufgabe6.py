def tri():
    fillcolor("Black")
    begin_fill()
    left(90)
    forward(5)
    right(120)
    forward(10)
    right(120)
    forward(10)
    right(120)
    forward(5)
    end_fill()

from turtle import *

def histogram(L1):
    speed(0)
    ch = []
    pr = []
    for i in range (len(L1)):
        p = 0
        if not L1[i] in ch:
            ch.append(L1[i])
            for j in range (len(L1)):
                if L1[i] == L1[j]:
                    p+=1
            pr.append(p)
    penup()
    goto(-(25*len(ch)),-(max(pr)*10))
    pendown()
    forward(20)
    forward(30*len(ch))
    tri()
    penup()
    goto(-(25*len(ch)),-(max(pr)*10))
    pendown()
    forward(max(pr)*20)
    tri()
    penup()
    goto((-(25*len(ch))+20),-(max(pr)*10))
    pendown()
    for i in range (len(pr)):
        fillcolor("Black")
        begin_fill()
        setheading(90)
        forward(20*pr[i])
        right(90)
        forward(10)
        right(90)
        forward(20*pr[i])
        end_fill()
        setheading(0)
    penup()
    goto((-(25*len(ch))+25),-(max(pr)*14))
    pendown()
    for i in range (len(ch)):
        write(ch[i])
        penup()
        forward(10)
        pendown()

histogram([1,2,2,4,3,3,4,3,3,4,4,4,6,7,6,5,6,7,9,8,7,89])
