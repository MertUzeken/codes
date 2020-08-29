from turtle import *


n = int(input("please give n for row / columns"))

speed(20)
#square
for i in range (4):
    forward(100)
    right(90)


#rows
for j in range (n):
    if j == 0:
        right(90)
        forward(100/n)
        left(90)
        forward(100)
        right(180)
        forward(100)
    elif j > 0:
        left(90)
        forward(100/n)
        left(90)
        forward(100)
        right(180)
        forward(100)
    elif j == n:
        left(90)


#columns

for g in range (n):
    if g == 0:
        right(180)
        forward(100/n)
        left(90)
        forward(100)
        right(180)
        forward(100)
    elif g > 0:
        left(90)
        forward(100/n)
        left(90)
        forward(100)
        right(180)
        forward(100)
# 3. Fills the squares
speed(2)

right(90)
forward(100/n) 
for s in range (1,n+1):
    print(s)
    if  s%2 != 0:
        fillcolor("black")
        begin_fill()
        right(90)
        forward(100/n)
        right(90)
        forward(100/n)
        right(90)
        forward(100/n)
        end_fill()
        right(90)
       # forward(100)
    elif s%2 == 0:
        if s%2 == 0:
            forward(100)
        else:
            forward(100/n)




        
        
    
        

