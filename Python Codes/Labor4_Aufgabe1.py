score = int(input("Enter a Score: "))

if score >=80 and score <= 100:
    print("Your grade: A")
elif score >=70 and score <80:
    print("Your grade: B")
elif score >=60 and score <70:
    print("Your grade: C")
elif score >=50 and score <60:
    print("Your grade: D")
elif score < 50:
    print("Your grade: F, You failed my friend")
