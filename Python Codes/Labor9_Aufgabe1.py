from tkinter import *

class counter:
    def __init__(self):
        window = Tk()
        window.title("counter")
        self.num = 0
        self.label = Label(window, height=2, width=12,text = self.num)
        self.label.grid(row = 2,column = 1)
        bt1 = Button(window, height=1, width=8, text = "+",command = self.plus).grid(row = 1,column = 2,sticky = E)
        bt2 = Button(window, height=1, width=8, text = "-",command = self.minus).grid(row = 2,column = 2,sticky = E)
        bt3 = Button(window, height=1, width=8, text = "Reset",command = self.reset).grid(row = 3,column = 2,sticky = E)
        window.mainloop()

    def plus(self):
        self.num +=1
        self.label["text"]=self.num
    def minus(self):
        self.num = self.num-1
        self.label["text"]=self.num
    def reset(self):
        self.num = 0
        self.label["text"]=self.num
        
counter()
