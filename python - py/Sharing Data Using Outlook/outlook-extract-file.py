"""
####################################################################################################
This script helps you to extract file automatically from email.
####################################################################################################
"""
import win32com.client as win32
from datetime import datetime as dt
from os import chdir, path, getlogin
from pathlib import Path

userid = getlogin()
chdir(f'C:\\Users\\{userid}')
outlook = win32\
    .Dispatch('Outlook.Application')\
    .GetNameSpace('MAPI')
inbox = outlook.GetDefaultFolder(6)
messages = inbox.Items
email_file = [
    {
        'folder':'', #provide folder name to be create here
        'subject':'', #provide subject here
        'file-name':'', #provide file name here
        'extension':'' # provide file extention, example : .xlsx
    }
]

for file in email_file:
    try:
        folder, subject, file_name, extension = file['folder'], file['subject'] ,file['file-name'] ,file['extension']
        output_dir = Path.cwd() / 'name the folder as you wish here example: reports from email' / folder
        output_dir.mkdir(parents=True, exist_ok=True)
        for message in messages:
            if str(message.Subject).startswith(f'{subject}'):
                email_date = message.senton.date().dt.strftime('%m-%d-%y')
                output_file = f'{file_name} - {email_date}{extension}'
                attachments = message.Attachments
                if path.isfile(output_dir / output_file):
                    print(f'{output_file} exists')
                    pass
                else:
                    for attachment in attachments:
                        if str(attachment).endswith(f'{extension}'):
                            attachment.SaveAsFile(output_dir / output_file)
                            print(f'{output_file} was created')
    except:
        pass