# Just a playground for learning and testing class inheritance.
# Note: Motorbikes obviously have no doors, but in order to not break the Liskov substitution principle -
# I'll have to keep using the Base Class Attributes. Cant leave door arg empty, it has to be 0 all the time.
# Solution: Cleanest way to do this is to create a new base Class with the attribute. (Although this is really stupid)


vehicleTypes= {0: 'Unknown', 1: 'Car', 2: 'MotorBike', 3: 'Truck'}

class Vehicle():
    def __init__(self, brand, color, doors, hp, wheels):
        self.brand = brand
        self.color = color
        self.doors = doors
        self.horsepower = hp
        self.wheels = wheels

    def info(self):
        print("This Vehicle of the " + self.getType(self.typeNumber) + " Type has the following Brand: " + self.brand + " and has the color: " + self.color)
        print("It got %d doors and %d wheels" % (self.doors ,self.wheels))
        print("Also its max performance is: %d hp" % (self.horsepower))
        print("")

    def setType(self, number):
        self.typeNumber = number
        
    def getType(self, typenumber):
        return vehicleTypes.__getitem__(typenumber)

class Car(Vehicle):
    def __init__(self,brand,color,doors,hp,wheels):
        self.setType(1)
        Vehicle.__init__(self,brand, color, doors, hp, wheels)


class Motorbike(Vehicle):
    def __init__(self, brand, color, doors, hp, wheels):
        self.setType(2)
        Vehicle.__init__(self, brand, color, doors, hp, wheels)


class Truck(Vehicle):
    def __init__(self, brand, color, doors, hp, wheels):
        self.setType(3)
        Vehicle.__init__(self, brand, color, doors, hp, wheels)


newCar = Car("Audi","Red", 4, 110, 4)
newCar.info()

newBike = Motorbike("BMW", "Blue", 0, 130, 2)
newBike.info()

newTruck = Truck("Mercedes Atros", "Black", 2, 200, 16)
newTruck.info()
