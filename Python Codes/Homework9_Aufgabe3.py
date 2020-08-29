from tkinter import *
from tkinter import Canvas
import random




class circles():
    def __init__(self):
        self.c = Canvas(width=400, height=300)
        self.c.pack()
        self.c.bind('<Button-1>', self.create_circle)
       # self.c.bind('<Button-2>', self.delete_circle)
        self.c.mainloop()

   # def delete_circle(self):

    def create_circle(self,event):
        global circle
        self.r = 30
        self.x1, self.y1 = event.x, event.y
        self.color = 'grey'
        self.circle = self.c.create_oval(self.x1 - self.r, self.y1 - self.r, self.x1 + self.r, self.y1 + self.r)



circles()
