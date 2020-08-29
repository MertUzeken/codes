def mark(score):
    if score >=80 and score <= 100:
        return 'A'
    elif score >=70 and score <80:
        return 'B'
    elif score >=60 and score <70:
        return 'C'
    elif score >=50 and score <60:
        return 'D'
    elif score < 50:
        return 'F'

p = int(input("Please Enter your score "))
print(mark(p))

