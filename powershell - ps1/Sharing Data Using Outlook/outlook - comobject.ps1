"""
####################################################################################################
This script helps you to send email automatically with a template body, usefull for sharing data.

Pre-requisites:
1. Powershell
2. Outlook

Steps:
1. Run the script
2. The script will send an email with the template body
3. You can use the script for sending email automatically
4. You can also attach files to the email

####################################################################################################
"""
$outlook = new-object -comobject outlook.application 
$email = $outlook.CreateItem(0) #create new screen
$email.Recipients.Add("email_name@company.com") 
$email.Subject = "Subject - Notification"
$email.BodyFormat = 1
# Basics HTML Required to build your desire out put
$email.htmlbody = "
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
"
$file = "File Path"
$email.Attachments.Add($file) #Adding file as attachments
$email.Display() ; $email.Send() #Display if you want see the email before sending, or Send directly on the background