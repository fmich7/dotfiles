import time
from ctypes import *
from pynput import keyboard
from pynput.keyboard import Key, Controller

_keyboard = Controller()


def doQResetBug():
    _keyboard.press('q')
    
    color = ""
    while True:
        sColor = windll.gdi32.GetPixel()
        if (sColor == color):
            break
    https://stackoverflow.com/questions/40822352/how-can-i-read-the-rgb-value-of-a-given-pixel-of-an-active-window
    _keyboard.press('s')
    _keyboard.release('q')
    _keyboard.release('s')

def on_press(key):
    if (key.char == 'q'):
        doQResetBug()

# Collect events until released
with keyboard.Listener(on_press=on_press) as listener:
    listener.join()

# ...or, in a non-blocking fashion:
listener = keyboard.Listener(on_press=on_press)
listener.start()