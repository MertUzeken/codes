class StationaryGood(object):
    def __init__(self, gd, nm, pc):
        self.gd = gd
        self.nm = nm
        self.pc = pc
        if self.__class__ == StationaryGood:
            raise NotImplementedError
    def getTotalCost(self):
        raise NotImplementedError

class Magazine(StationaryGood):
    def __init__(self, gd, nm, pc):
        StationaryGood.__init__(self, gd, nm, pc)
        self.gd = gd
        self.nm = int(nm)
        self.pc = float(pc)
    def getTotalCost(self):
        self.cost = self.pc * self.nm
        return str(self.gd) + " : %d units x %.2f Bahts = %.2f" %(self.nm,self.pc,self.cost)
    def Cost(self):
        return self.cost

class Book(StationaryGood):
    def __init__(self, gd, nm, pc):
        StationaryGood.__init__(self, gd, nm, pc)
        self.gd = gd
        self.nm = int(nm)
        self.pc = float(pc)
    def getTotalCost(self):
        self.cost = (self.pc * self.nm) * 0.9
        return str(self.gd) + " : %d units x %.2f Bahts = %.2f" %(self.nm,self.pc,self.cost)
    def Cost(self):
        return self.cost

class Ribbon(StationaryGood):
    def __init__(self, gd, nm, pc):
        StationaryGood.__init__(self, gd, nm, pc)
        self.gd = gd
        self.num = int(nm)
        self.pc = float(pc)
    def getTotalCost(self):
        self.cost = self.nm * self.pc
        return str(self.gd) + " Ribbon : %d units x %.2f Bahts = %.2f" %(self.nm,self.pc,self.cost)
    def Cost(self):
        return self.cost
        
basket = [Magazine("Computer World",3,70), Book("Windows 7 for Beginners",2,200), Ribbon("Blue", 10, 5)]
sum = 0
for goods in basket:
    print(goods.getTotalCost())
    sum += goods.Cost()
print("Total price : %.2f Bahts" %(sum))
