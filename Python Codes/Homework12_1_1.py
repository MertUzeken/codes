import abc
from turtle import *

class Char(metaclass=abc.ABCMeta):
    def __init__(self, w = 50):
        self._w = w
    def getWidth(self):
        return self._w
    @abc.abstractmethod
    def draw(x, y):
        pass
    
class Char0(Char):
    def __init__(self, w = 50):
        super().__init__(w)
    def draw(self,x,y):
        pu()
        seth(0)
        goto(x,y)
        pd()
        for i in range (2):
            fd(super().getWidth())
            lt(90)
            fd(super().getWidth() * 1.5)
            lt(90)
    def getWidth(self):
        return self._w
    
class Char1(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        seth(0)
        pd()
        fd(super().getWidth())
        lt(180)
        fd(super().getWidth() / 2)
        rt(90)
        fd(super().getWidth() * 1.5)
        lt(90)
        fd(super().getWidth() / 4)
    def getWidth(self):
        return self._w
    
class Char2(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        seth(0)
        pd()
        fd(super().getWidth())
        bk(super().getWidth())
        lt(90)
        fd(super().getWidth() * 0.75)
        rt(90)
        fd(super().getWidth())
        lt(90)
        fd(super().getWidth() * 0.75)
        lt(90)
        fd(super().getWidth())
    def getWidth(self):
        return self._w
    
class Char3(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self.width = width
    def draw(self,x,y):
        pu()
        goto(x,y)
        seth(0)
        pd()
        fd(super().getWidth())
        lt(90)
        fd(super().getWidth() * 0.75)
        lt(90)
        fd(super().getWidth())
        bk(super().getWidth())
        rt(90)
        fd(super().getWidth() * 0.75)
        lt(90)
        fd(super().getWidth())
    def getWidth(self):
        return self._w
    
class Char4(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        seth(0)
        lt(90)
        fd(super().getWidth() / 2)
        pd()
        fd(super().getWidth())
        bk(super().getWidth())
        rt(90)
        fd(super().getWidth())
        lt(90)
        bk(super().getWidth() / 2)
        fd(super().getWidth() * 1.5)
    def getWidth(self):
        return self._w
    
class Char5(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        seth(0)
        pd()
        fd(super().getWidth())
        lt(90)
        fd(super().getWidth() * 0.75)
        lt(90)
        fd(super().getWidth())
        rt(90)
        fd(super().getWidth() * 0.75)
        rt(90)
        fd(super().getWidth())
    def getWidth(self):
        return self._w
    
class Char6(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        seth(0)
        pd()
        for i in range (4):
            fd(super().getWidth())
            lt(90)
        lt(90)
        fd(super().getWidth() * 1.5)
        rt(90)
        fd(super().getWidth())
    def getWidth(self):
        return self._w
    
class Char7(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        seth(0)
        fd(super().getWidth())
        pd()
        lt(90)
        fd(super().getWidth() * 1.5)
        lt(90)
        fd(super().getWidth())
    def getWidth(self):
        return self._w
    
class Char8(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        pd()
        seth(0)
        for i in range (4):
            fd(super().getWidth())
            lt(90)
        lt(90)
        fd(super().getWidth())
        rt(90)
        fd(super().getWidth() / 4)
        for i in range (4):
            fd(super().getWidth() / 2)
            lt(90)
    def getWidth(self):
        return self._w
    
class Char9(Char):
    def __init__(self, w = 50): 
        super().__init__(w)
        self._w = w
    def draw(self,x,y):
        pu()
        goto(x,y)
        pd()
        seth(0)
        fd(super().getWidth())
        lt(90)
        fd(super().getWidth() * 1.5)
        for i in range (4):
            lt(90)
            fd(super().getWidth())
    def getWidth(self):
        return self._w
    
def drawNum(x, size):
    coX = 0
    coY = 0
    x = str(x)
    dict1 = {"0":Char0(size),"1":Char1(size),"2":Char2(size),"3":Char3(size),
         "4":Char4(size),"5":Char5(size),"6":Char6(size),
         "7":Char7(size),"8":Char8(size),"9":Char9(size)}
    ht()
    for char in x:
        for key in dict1:
            if(char==key):
                d[key].draw(coX, coY)
                coX += size * 1.5
