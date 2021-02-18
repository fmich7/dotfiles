#!/usr/bin/env python
import os

direc = r'C:\Users\{your_name}\Downloads'

picturePath = '- Images -'
execPath = '- Executable -'
documentsPath = '- Documents -'
mediaPath = '- MusicVideos -'
packedPath = '- RARZIP other packed -'
proggramingPath = '- PROGGRAMING STUFF -'

directories = {
    "jpeg": picturePath,
    "jpg": picturePath,
    "png": picturePath,
    "gif": picturePath,
    "tiff": picturePath,
    "psd": picturePath,
    "ai": picturePath,
    "indd": picturePath,
    "raw": picturePath,

    "doc": documentsPath,
    "docx": documentsPath,
    "html": documentsPath,
    "htm": documentsPath,
    "odt": documentsPath,
    "pdf": documentsPath,
    "xls": documentsPath,
    "xlsx": documentsPath,
    "ods": documentsPath,
    "ppt": documentsPath,
    "pptx": documentsPath,
    "txt": documentsPath,

    "aif": mediaPath,
    "cda": mediaPath,
    "mid": mediaPath,
    "mp3": mediaPath,
    "mpa": mediaPath,
    "ogg": mediaPath,
    "wav": mediaPath,
    "wma": mediaPath,
    "wpl": mediaPath,

    "7z": packedPath,
    "arj": packedPath,
    "deb": packedPath,
    "pkg": packedPath,
    "rar": packedPath,
    "rpm": packedPath,
    "tar.gz": packedPath,
    "z": packedPath,
    "zip": packedPath,

    "apk": execPath,
    "bat": execPath,
    "bin": execPath,
    "cgi": execPath,
    "com": execPath,
    "exe": execPath,
    "gad": execPath,
    "jar": execPath,
    "msi": execPath,
    "wsf": execPath,

    "py": proggramingPath,
    "c": proggramingPath,
    "class": proggramingPath,
    "cpp": proggramingPath,
    "cs": proggramingPath,
    "h": proggramingPath,
    "java": proggramingPath,
    "pl": proggramingPath,
    "sh": proggramingPath,
    "swift": proggramingPath,
    "c#": proggramingPath,
    "vb": proggramingPath
}


def main():
    count = 0
    for file in os.listdir(direc):
        # get extension from file name
        extension = file.split('.')[-1]
        # if extension is unknown -> continue loop
        if extension.lower() not in directories:
            continue
        # get correct dir by extension
        dir = directories[extension]
        # check if folder exists, if not -> make it
        if not os.path.exists(f"{direc}\{dir}"):
            os.makedirs(f"{direc}{dir}")
        # move file to target dir
        os.rename(f"{direc}\{file}", f"{direc}\{dir}\{file}")
        count += 1

    return count


print(f"{main()} files were moved")
