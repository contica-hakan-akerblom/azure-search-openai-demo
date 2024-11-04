# num = int(input("Enter a number: "))
# while num:
#     if num == 1:
#         print(num)
#         break
#     elif num % 2 == 0:
#         print(num, end=' -> ')
#         num = num // 2
#     elif num % 2 == 1:
#         print(num, end=' -> ')
#         num = 3 * num + 1
# mystring = ""
# num = int(input("Enter a number: "))
# while num != 1:            # Loop until num reaches 1
#     if num % 2 == 0:       # Check if num is even
#         num = num // 2     # Divide by 2 for even numbers
#     else:
#         num = 3 * num + 1  # Multiply by 3 and add 1 for odd numbers
#     mystring += str(num) + " -> "  # Append the number to the string
# print(mystring[:-3])            # Print the string

def collatz_sequence(n):
    # Base case: if n is 1, return the list containing only 1
    if n == 1:
        return [1]
    # Recursive case: apply the Collatz rules, and call the function recursively
    elif n % 2 == 0:
        return [n] + collatz_sequence(n // 2)
    else:
        return [n] + collatz_sequence(3 * n + 1)

# Get user input
num = int(input("Enter a number: "))

# Generate the sequence
sequence = collatz_sequence(num)

# Print the sequence in the desired format
print(" -> ".join(map(str, sequence)))