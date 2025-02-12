"""
####################################################################################################
This script helps you to keep app files up to date on destination removing manual drag and drop
####################################################################################################
"""
function global:update-folderFiles{
    param(
        $Source,
        $Folder,
        $Destination
    )
    $username = $Env:USERNAME
    $updates = ls -Path $Source
    $main = $Folder
    $result = @()
    $Destination | ForEach-Object {
        $destination = "$main\$($_)"
        $file = (ls -Path "$main\$($_)")
        $file | ForEach-Object {
            foreach($update in $updates){
                if($update.Name -eq $_.Name -and $update.LastWriteTime -ne $_.LastWriteTime){
                    Copy-Item -Path "$source\$($update.Name)" -Destination "$destination\$($_)"
                    $result+=[PsCustomObject]@{
                        Status = "Updated"
                        File = "$($_)"
                        Location = "$destination"
                    }
                }elseif ($update.Name -eq $_.Name -and $update.LastWriteTime -eq $_.LastWriteTime) {
                    $result+=[PsCustomObject]@{
                        Status = "Up-To-Date"
                        File = "$($_)"
                        Location = "$destination"
                    }
                }
            }
        }
    }
    return $result
}
update-files -Source "Principal Location Here" -Folder "Destination General Folder" -Destination @("SubFolder to update files")