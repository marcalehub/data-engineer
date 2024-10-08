"""
####################################################################################################
This script helps you to extract file automatically from email.
####################################################################################################
"""
$userid = $Env:USERNAME
set-location "C:\Users\$userid"
$outlook = new-object -comobject outlook.application 
$mapi = $outlook.GetNamespace("MAPI")
$inbox = $mapi.GetDefaultFolder(6)
$messages = $inbox.Items
@(
    @{
        "folder" = "" #provide folder name to be create here
        "subject" = "" #provide subject here
        "file-name" = "" #provide file name here
        "extension" = "" # provide file extention, example : .xlsx
    }
) | Foreach-Object{
    try {
        $folder = $_.folder; $subject = $_.subject; $file_name = $_."file-name"; $extension = $_.extension
        if(Test-Path -path $folder -PathType Container){
            ;
        }else{
            New-Item -path $folder -ItemType Directory
        }
        $messages | Foreach-Object{
            if (($_.ConversationTopic).startswith($subject)){
                $email_date = get-date($_.CreationTime) -format "MM-dd-yy"
                $output_file = "C:\Users\$userid\$folder\$file_name - $email_date.$extension"
                $attachments = $_.Attachments
                write-host $output_file
                if(Test-Path -path $output_file){
                    ;
                }
                } else {       
                    foreach($attachment in $attachments){
                        if (($attachment.FileName).endswith($extension)){
                            if(Test-Path -path $output_file){
                               ;
                            }else{                                
                                $attachment.SaveAsFile($output_file)
                                write-host "$output_file was created"
                            }
                        }
                    }            
                    }
                }
    }
    catch {
        write-host "Something went wrong: $($_.Exception.Message)"
    }
}
