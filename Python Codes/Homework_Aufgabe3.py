from turtle import *


class Points(object):
    def __init__(self, List):
        self.x = []
        self.y = []
        for i in range(len(List)):
            if i % 2 == 0:
                self.x.append(float(List[i]))
            else:
                self.y.append(float(List[i]))
        self.minX = min(self.x)
        self.maxX = max(self.x)
        self.minY = min(self.y)
        self.maxY = max(self.y)

    def draw(self):
        ht()
        for i in range(len(self.x)):
            pu()
            goto(self.x[i], self.y[i])
            pd()
            dot(6)


class Rectangle2D(object):
    def __init__(self, points):
        self.x = points.minX - 10 - 10
        self.y = points.maxY + 10
        self.w = points.maxX - points.minX + 20
        self.h = points.maxY - points.minY + 20
        self.center = (self.x + self.w / 2, self.y - self.h / 2)

    def draw(self):
        pu()
        goto(self.x, self.y)
        fd(self.w / 2)
        pd()
        for i in range(2):
            fd(self.w)
            rt(90)
            fd(self.h)
            rt(90)
        ht()

    def displayInfo(self):
        print("The Rectangle is centered at (%.2f,%.2f)" % (self.x + self.w / 2, self.y - self.h / 2),
              "with a width of: %.1f and a height of: %.1f" % (self.w, self.h))


def main():
    while True:
        inText = input("Enter the points: ")
        List = inText.split(" ")
        points = Points(List)
        rect = Rectangle2D(points)
        rect.displayInfo()
        rect.draw()
        points.draw()


main()
