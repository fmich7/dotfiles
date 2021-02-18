import datetime
import os
import sys
import pyautogui
import re
from pathlib import Path
weekDays = ("Poniedziałek","Wtorek","Środa","Czwartek","Piątek","Sobota","Niedziela")
plan = {"Poniedziałek": "- - Matematyka Niemiecki Polski Polski Historia Religia Angielski Informatyka",
        "Wtorek": "- Angielski Geografia Matematyka Matematyka Historia WF Wf Wos",
        "Środa": "- - Geografia Fizyka Matematyka Polski PP Biologia Chemia",
        "Czwartek": "Angielski Biologia Informatyka Matematyka Religia Fizyka Niemiecki Chemia",
        "Piątek": "Fizyka Matematyka Matematyka Fizyka Polski WF"}
dzwonki = ["8:00-8:45", "8:50-9:35", "9:40-10:25", "10:35-11:20", "11:40-12:25", "12:35-13:20", "13:30-14:15", "14:20-15:05", "15:10-15:55", "16:00-16:45"]
directory = r'C:\Users\Filip\Desktop\Lekcje'
def takeScreenshot():
    date = f'{datetime.datetime.now().date()} {weekDays[datetime.datetime.now().weekday()]}' 
    folder = whatLessonIsNow()
    lessonDirectory = f'{directory}\{folder}\{date}'

    Path(lessonDirectory).mkdir(parents=True, exist_ok=True)
    
    index = getScreenshotIndex(lessonDirectory) + 1
    title = f"{index}-screenshot"
    pyautogui.screenshot().save(r'{}\{}.png'.format(lessonDirectory, title))

def getScreenshotIndex(directory: str):
    index = 0
    for file in os.listdir(directory):
        #check if file name matches regex
        if re.search("^[0-9]+-screenshot.png$", file):
            number = int(file.split('-')[0])
            if number > index:
                index = number
        else:
            continue
    return index

def whatLessonIsNow():
    #sprawdza czy jest weekend
    if datetime.datetime.now().weekday() > 5:
        return "Inne"
    
    matchingTime = str()
    for time in dzwonki:
        timeStr = time.split('-')
        times = list()
        for x in timeStr:
            h = int(x.split(":")[0])
            m = int(x.split(":")[1])
            times.append(datetime.timedelta(hours=h, minutes=m))
        currentTimeStr = str(datetime.datetime.now().time()).split(':')
        currentTime = datetime.timedelta(hours=int(currentTimeStr[0]), minutes=int(currentTimeStr[1]))
        if times[0] <= currentTime <= times[1]:
                matchingTime = time
    if matchingTime != "":
        index = dzwonki.index(matchingTime)
        lessons = plan[weekDays[datetime.datetime.now().weekday()]].split(" ")
        if len(sys.argv) >= 2:
            lesson = sys.argv[1]
        elif index <= len(lessons) - 1 and lessons[index] != '-':
            lesson = lessons[index]
        else:
            lesson = "Inne"
    else:
        lesson = "Inne"
    print(lesson)
    return lesson
   
if __name__ == "__main__":
    takeScreenshot()
