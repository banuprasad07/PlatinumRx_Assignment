# 01_Time_Converter.py

def convert_minutes(total_minutes):
    hours = total_minutes // 60
    minutes = total_minutes % 60

    if hours == 1:
        return f"{hours} hr {minutes} minutes"
    else:
        return f"{hours} hrs {minutes} minutes"

# Testing
print(convert_minutes(130))   # Output: 2 hrs 10 minutes
print(convert_minutes(110))   # Output: 1 hr 50 minutes
print(convert_minutes(200))   # Output: 3 hrs 20 minutes
