import math

name =input("Enter employee's name: ")
hours=float(input("Enter number of hours worked in a week: "))
hpay =float(input("Enter hourly pay rate: "))
fedtax=float(input("Enter federal tax withholding rate: "))
statetax=float(input("Enter state tax withholding rate: "))
grosspay = hours*hpay

print("Employee's Name : ", name)
print("Hours Worked: ", hours)
print("Pay Rate: $", hpay)
print("Gross Pay: ", grosspay)

print("Deductions:")

fedwithhold = fedtax * grosspay / 100
statewithhold = statetax * grosspay / 100

format(fedwithhold,"2.2f")


print("Federal Withholding(",fedtax,"%):",fedwithhold)
print("State Withholding(",statetax,"%):{:0.2f}".format(statewithhold))

total =  fedwithhold + statewithhold
print("Total Deduction: :{:0.2f}".format(total))
net = grosspay - total
print("Netpay: :{:0.2f}".format(net))
