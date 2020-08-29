def prime(x):
    if x > 1:
        for i in range(2,x):
            if x % i == 0:
                return 'not a prime Number'
            else:
                return 'Is prime Number'



while True:
    val = int(input("Please enter your number"))
    print(prime(val))
