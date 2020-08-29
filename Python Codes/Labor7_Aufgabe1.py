class Time:
    def __init__(self,hour,minute,second):
        self.hour = hour
        self.minute = minute
        self.second = second

        
    def display(self):
        self.hour = str(self.hour)
        self.minute = str(self.minute)
        self.second = str(self.second)
        print(self.hour + ":" + self.minute + ":" + self.second + "Hrs.")

def main():
    time1 = Time(9,30,0)
    time1.display()

main()
