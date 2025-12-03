# 02_Remove_Duplicates.py

def remove_duplicates(text):
    result = ""
    for char in text:
        if char not in result:
            result += char
    return result

# Testing
print(remove_duplicates("banana"))       # Output: ban
print(remove_duplicates("mississippi"))  # Output: misp
print(remove_duplicates("apple"))        # Output: aple
