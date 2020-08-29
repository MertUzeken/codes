def time_convert(hour,minutes):
    if hour > 12:
        hour -= 12
        shour = str(hour)
        smin = str(minutes)
        if hour <= 9:
            newtime = "0" + shour + ":" + smin +"pm"
        elif hour > 9:
            newtime = shour + ":" + smin + "pm"
        return newtime
    elif hour < 12:
        shour = str(hour)
        smin = str(minutes)
        newtime = "0" + shour + ":"+ smin + "am"
        return newtime
    elif hour == 12:
        shour = str(hour)
        smin = str(minutes)
        newtime = shour + ":" + smin + "pm"
        return newtime

time = str(input("Enter the time in following format: HH:MM, dont forget to seperate by semicolon"))
hour = int(time[0]+time[1])
minutes = int(time[3]+time[4])
newtime = time_convert(hour,minutes)
print(newtime)
