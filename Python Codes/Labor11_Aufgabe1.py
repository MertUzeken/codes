from math import pi


class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def printInfo(self):
        print("%d %d", self.x, self.y)


class Circle(Point):
    def __init__(self, x, y, radius):
        super().__init__(x, y)
        self.r = radius

    def area(self):
        self.Area = (pi * self.r**2)

    def printInfo(self):
        self.area()
        print("Given x: ",self.x,"Given y: ",self.y,"Given Radius: ",self.r,"Area of the Circle = ",self.Area)


class Cylinder(Circle):
    def __init__(self,x,y,radius,height):
        super().__init__(x,y,radius)
        self.height = height
    def area(self):
        self.cyarea = 2 * pi * self.r**2 * self.height + 2 * pi * self.r**2

    def volume(self):
        self.vol = pi * self.r**2 * self.height

    def printInfo(self):
        self.area()
        self.volume()
        print("Given x: ", self.x, "Given y: ","Given height: ", self.height, self.y, "Given Radius: ", self.r, "Area of the Cylinder = ", self.cyarea, "Volume of the Cylinder = ",self.vol)

a = Circle(15,20,7)
a.printInfo()

b = Cylinder(15,20,7,10)
b.printInfo()
