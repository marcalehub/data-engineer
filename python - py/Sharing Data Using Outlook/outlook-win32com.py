"""
####################################################################################################
This script helps you to send email automatically with a template body, usefull for sharing data.
####################################################################################################
"""
#import required library or install it using pip (After Python has been installed)#
import win32com.client as win32
from os import getcwd, path
outlook = win32\
        .Dispatch('Outlook.Application')\
        .GetNameSpace('MAPI')
email = outlook.CreateItem(0) #create new screen
email.Subject = "Subject - Notification"
email.BodyFormat = 1
# Basics HTML Required to build your desire out put
email.htmlbody = """
        <font size = '+1.2'>
            <p>Hi, Hello World</p>
            <p>Best Regards,</p>
        </font>
        <font size ='+1.2'>
            <p><font color='blue'>_____________________________________________________________________</font></p>
            <b>Name</b>
            <p>Role and Department</p>
            <p><b>Division</b></p>
            <p>Address</p>
            <p>Country</p>
            <p><font color='blue'>_____________________________________________________________________</font></p>
        </font>
"""
file = "File Path"
email.Attachments.Add(path.join(getcwd(), file)) #Adding file as attachments
email.Display() ; email.Send() #Display if you want see the email before sending, or Send directly on the background