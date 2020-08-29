

def BMI_calc():

    n = str(input("Name: "))
    age = int(input("Age: "))
    h = float(input("Height in Meter: "))
    w = float(input("weight in Kilogramms: "))

    #convert cm to m

    BMI = w/h**2

    print("Your body mass index (BMI) is: ", BMI)

    if age < 17:
        if BMI < 15:
            print("You", n," are underweight")
        elif BMI >=15 and BMI <=20:
            print("You", n," are normal")
        elif BMI >20:
            print("You", n," are overweight")
    elif age >= 17 and age <=35:
        if BMI < 18:
            print("You", n," are underweight")
        elif BMI >=18 and BMI <=24:
            print("You", n," are normal")
        elif BMI >24:
            print("You", n," are overweight")
    elif age > 35:
        if BMI < 19:
            print("You", n," are underweight")
        elif BMI >=19 and BMI <=26:
            print("You", n," are normal")
        elif BMI >26:
            print("You", n," are overweight")

BMI_calc()
