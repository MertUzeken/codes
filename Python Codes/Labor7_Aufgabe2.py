class BankAccount:
    def __init__(self,bname,uname,accnr,bln):
        self.bname = bname
        self.uname = uname
        self.accnr = accnr
        self.bln   = bln
    def deposit(self, val):
        self.bln += val
    def withdraw(self, val):
        self.bln -= val
    def display(self):
        print("The current balance is: ", self.bln)



def main():
    user1 = BankAccount("Volksbank GG","Mert","10849992",1300.42)
    user1.deposit(300)
    user1.withdraw(400)
    user1.display()

main()
