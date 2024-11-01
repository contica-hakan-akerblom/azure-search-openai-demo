num = int(input("Enter a number: "))
while num:
    if num == 1:
        print(num)
        break
    elif num % 2 == 0:
        print(num, end=' -> ')
        num = num // 2
    elif num % 2 == 1:
        print(num, end=' -> ')
        num = 3 * num + 1
    
    