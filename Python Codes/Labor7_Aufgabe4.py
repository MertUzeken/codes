import math

class Quadratic_Equation:
    def __init__(self,a,b,c):
        self.__a = a
        self.__b = b
        self.__c = c
        
    def getA(self):
        print(self.__a)
    def getB(self):
        print(self.__b)
    def getC(selft):
        print(self.__c)
        
    def Discriminant(self):
        d = int((self.__b**2) - (4*self.__a*self.__c))
        return d

    def getRoot1(self):
        d = int((self.__b**2) - (4*self.__a*self.__c))
        if d < 0:
            return 0
        else:
            x = int(-(self.__b + math.sqrt(d)/(2*self.__a)))
            return x

    def getRoot2(self):
        d = int((self.__b**2) - (4*self.__a*self.__c))
        if d < 0:
            return 0
        else:
            x = int(-(self.__b - math.sqrt(d)/(2*self.__a)))
            return x

def main():
    eq1 = Quadratic_Equation(100,-2,1)
    print(eq1.Discriminant())
    print(eq1.getRoot1())
    print(eq1.getRoot2())
    
main()

