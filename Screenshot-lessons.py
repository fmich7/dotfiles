import datetime
import os
import pyautogui
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
        number = int(file.split('-')[0])
        if number > index:
            index = number
    return index

def whatLessonIsNow():
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

    try:
        lesson = plan[weekDays[datetime.datetime.now().weekday()]].split(" ")[dzwonki.index(matchingTime)]
    except:
        lesson = "Inne"

    print(lesson)
    return lesson
   
if __name__ == "__main__":
    takeScreenshot()
