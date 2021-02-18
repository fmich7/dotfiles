Gui, Add, Text,, Lekcja:
Gui, Add, Edit, vlesson
Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
Gui, Show,, Simple Input Example
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ExitApp

ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
MsgBox Lekcja: "%lesson%".

F1::
Run "C:\Programowanie\dotfiles\Auto screenshot\Lessons-screenshot.pyw " %lesson%
Return
