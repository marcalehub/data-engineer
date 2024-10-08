"""
####################################################################################################
This script helps you to reply email automatically.
####################################################################################################
"""
import win32com.client as win32
from os import *
outlook = win32.Dispatch('Outlook.Application').GetNameSpace('MAPI') 
folders = outlook.GetDefaultFolder(6)
file = "file path"
def reply(email:object):
        reply = email.Reply()
        reply.bodyformat = 1
        reply.Subject = f''
        reply.To = ''
        reply.Bcc = ''
        message = ''
        reply.HTMLBody = f'{message}{reply.HTMLBody}' #combine last reply with your need message
        reply.Attachments.Add(path.join(getcwd(), f'{file}'))
        #email.Send() or email.Display()

found = False
for inbox in folders.Items:
        if inbox.Subject == '': #desire subject to look up
                message = inbox 
                found = True
reply(message) #this method helps you to keep the last email sent with the desire subject

if not found:
    outlook = win32.Dispatch('Outlook.Application').GetNameSpace('MAPI')
    email = outlook.CreateItem(0)
    email.bodyformat = 1
    email.Subject = ''
    email.To = ''
    email.Bcc = ''
    email.HTMLBody = ''
    email.Attachments.Add(path.join(getcwd(), f'{file}'))
    #email.Send() or email.Display()