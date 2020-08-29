from math import *

class Calculator:
    def __init__(self,acc):
        self.acc = acc
    def set_accumulator(self,a):
        self.acc = a
    def get_accumulator(self):
        acc = self.acc
    def add(self,x):
        self.acc += x
    def subtract(self,x):
        self.acc -= x
    def multiply(self,x):
        self.acc *= x
    def divide(self,x):
        self.acc /= x
    def print_result(self):
        print(self.acc)

class Sci_calc(Calculator):
    def __init__(self,acc):
        super().__init__(acc)
    def square(self):
        self.acc = self.acc**2
    def exp(self,x):
        self.acc = self**x
    def factorial(self):
        self.acc = factorial(self.acc)
    def print_result(self):
        print(self.acc)

a = Calculator(0)
a.add(5)
a.print_result()
