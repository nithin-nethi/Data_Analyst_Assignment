mins = int(input("Enter minutes: "))

hours = mins // 60
remng_minutes = mins % 60

if hours == 1:
    hour_text = "1 hr"
else:
    hour_text = str(hours) + " hrs"

if remng_minutes == 1:
    min_text = "1 minute"
else:
    min_text = str(remng_minutes) + " minutes"

print(hour_text + " " + min_text)