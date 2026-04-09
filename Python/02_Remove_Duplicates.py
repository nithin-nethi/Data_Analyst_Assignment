string = input("Enter string: ")

result = ""
seen = set()

for char in string:
    if char not in seen:
        result += char
        seen.add(char)

print("Unique string:", result)