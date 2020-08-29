class Name:
    def __init__(self,title,firstname,lastname):
        self.title = title
        self.fn = firstname
        self.ln = lastname

    def setName(self,t,f,l):
        self.title = t
        self.fn =  f
        self.ln = l
    def getFullname(self):
        return self.title + self.fn + self.ln

class Date:
    def __init__(self,day,month,year):
        self.day = day
        self.month = month
        self.year = year

    def setDate(self,d,m,y):
        self.day = d
        self.month = m
        self.year = y
    def getDate(self):
        return str(self.day + "/" + self.month + "/" + self.year)
    def getDateBC(self):
        return str(self.day + "/" + self.month + "/" + self.year + "BC")

class Adress:
    def __init__(self):
        self.houseno = houseno
        self.street = street
        self.district = district
        self.city = city
        self.country = country
        self.postcode = postcode
    def setAdress(self,houseNo,street,district,country,postcode):
        self.houseno = houseNo
        self.street = street
        self.district = district
        self.city = city
        self.country = country
        self.postcode = postcode
    def getAdress(self):
        return str((self.houseno + self.street + self.district + self.city + self.country + self.postcode))

class Department:
    def __init__(self):
        self.dscrpt = discription
        self.manage = manager
        self.employeeList = employeeList

    def addEmployee(self,E_e):
        self.employeeList.append(E_e)

    def deleteEmployee(self,E_e):
        if employee in self.employeeList: self.employeeList.remove(employee)

    def setManager(self,E_e):
        def printInfo(self):
            print(self.dscrpt,self.manage,self.employeeList)


class Person:
    def __init__(self):
        self.name = name
        self.birthdate = bday
        self.adress = adress
    def printInfo(self):
        print("Name: ", self.name, "Birthday :", self.birthdate, "Adress : ", self.adress)

class Employee(Person):
    def __init__(self):
        super().__init__()
        self.startDate = startDate
        self.department = department

    def printInfo(self):
        print("Name: ", self.name, "Birthday :", self.birthdate, "Adress : ", self.adress, "StartDate :", self.startDate, "department: ", self.department)

class TempEmployee(Employee):
    def __init__(self):
        super().__init__()
        self.wage = wage

    def printInfo(self):
        print("Name: ", self.name, "Birthday :", self.birthdate, "Adress : ", self.adress, "StartDate :",
              self.startDate, "department: ", self.department, "wage : ", self.wage)

class PermEmployee(Employee):
    def __init__(self):
        super().__init__()
        self.salary = salary

    def printInfo(self):
        print("Name: ", self.name, "Birthday :", self.birthdate, "Adress : ", self.adress, "StartDate :",
              self.startDate, "department: ", self.department, "wage : ", self.wage, "salary : ", self.salary)




        #Zu 90% richtig, paar kleine fehler vorhanden.
