from tkinter import *
from tkinter import messagebox

class KMITLPHONE:
    def press(self,num):
        self.display += str(num)
        self.label.configure(text=self.display)
    def call(self):
        messagebox.showinfo("Calling" + self.display, "Connection is being established...")
    def DELETE(self):
       self.display = self.display[:-1]
       self.label.configure(text=self.display)

    def __init__(self):
        window = Tk()
        window.title("KMITL Phone")
        window.geometry("450x400")
        self.display = ""

        self.label = Label(window, text=self.display, bg="grey", height=2, width=42)
        self.label.grid(columnspan=4)

        b1 =    Button(window, text="1", height=4, width=14, command=lambda: self.press("1")).grid(row=2, column=1)
        b2 =    Button(window, text="2", height=4, width=14, command=lambda: self.press("2")).grid(row=2, column=2)
        b3 =    Button(window, text="3", height=4, width=14, command=lambda: self.press("3")).grid(row=2, column=3)
        b4 =    Button(window, text="4", height=4, width=14, command=lambda: self.press("4")).grid(row=3, column=1)
        b5 =    Button(window, text="5", height=4, width=14, command=lambda: self.press("5")).grid(row=3, column=2)
        b6 =    Button(window, text="6", height=4, width=14, command=lambda: self.press("6")).grid(row=3, column=3)
        b7 =    Button(window, text="7", height=4, width=14, command=lambda: self.press("7")).grid(row=4, column=1)
        b8 =    Button(window, text="8", height=4, width=14, command=lambda: self.press("8")).grid(row=4, column=2)
        b9 =    Button(window, text="9", height=4, width=14, command=lambda: self.press("9")).grid(row=4, column=3)
        bstar = Button(window, text="*", height=4, width=14, command=lambda: self.press("*")).grid(row=5, column=1)
        b0 =    Button(window, text="0", height=4, width=14, command=lambda: self.press("0")).grid(row=5, column=2)
        bhash = Button(window, text="#", height=4, width=14, command=lambda: self.press("#")).grid(row=5, column=3)
        btalk = Button(window, text="Talk", height=4, width=14, command=lambda:self.call()).grid(row=6, column=1)
        bdel =  Button(window, text="DEL", height=4, width=14,  command=lambda:self.DELETE()).grid(row=6, column=3)

        window.mainloop()




KMITLPHONE()

