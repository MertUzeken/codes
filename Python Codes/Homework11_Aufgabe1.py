from time import *

class Clock:
    def __init__(self,hh=0,mm=0,ss=0):
        self.hour = hh
        self.minute = mm
        self.second = ss

    def run(self):
        while(True):
            self.second += 1
            if self.second == 60:
                self.second = 0
                self.minute+=1
                if self.minute == 60:
                    self.minute = 0
                    self.hour+=1
                    if self.hour == 24:
                        self.hour = 0
            sleep(1)

            print(str(self.hour) + ":" + str(self.minute) + ":" + str(self.second))

    def setTime(self,h,m,s):
        self.hour = h
        self.minute = m
        self.second = s

class AlarmClock(Clock):
    def __init__(self,alarm_hh=0,alarm_mm=0,alarm_ss=0,alarm_on_off=True):
        super().__init__()
        self.alarm_H = alarm_hh
        self.alarm_M = alarm_mm
        self.alarm_S = alarm_ss
        self.ON_OFF = alarm_on_off
    def setAlarmTime(self,h,m,s):
        self.alarm_H = h
        self.alarm_M = m
        self.alarm_S = s
    def alarm_on(self):
        self.ON_OFF = True
    def alarm_off(self):
        self.ON_OFF = False
    def run(self):
        while (True):
            self.second += 1
            if self.second == self.alarm_S and self.minute == self.alarm_M and self.hour == self.alarm_H:
                print("ALARM!")
            if self.second == 60:
                self.second = 0
                self.minute += 1
                if self.minute == 60:
                    self.minute = 0
                    self.hour += 1
                    if self.hour == 24:
                        self.hour = 0
            sleep(1)

            print(str(self.hour) + ":" + str(self.minute) + ":" + str(self.second))


new = AlarmClock()
new.setTime(13,30,50)
new.setAlarmTime(13,30,55)
new.run()