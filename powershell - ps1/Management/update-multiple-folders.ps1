"""
####################################################################################################
This script helps you to keep app files up to date on destination removing manual drag and drop
####################################################################################################
"""
function global:update-subfolderFiles{
    param(
        $Source,
        $Destination
    )
    $updates = @()
    $main = $Destination.folder
    $Destination.subfolder | foreach-object{
        $full_path = "$($main)\$($_)"
        ls -Path "$($main)\$($_)" | Where-Object {$_.Name -match "-" } | ForEach-Object{
            $full_Subpath = "$($full_path)\$($_.Name)" 
            ls -Path "$($full_path)\$($_.Name)" | foreach-object{
                $updates+=[PsCustomObject]@{
                    update_file = $_.Name
                    update_LastWriteTime = $_.LastWriteTime
                    update_location = $full_Subpath
                }
            }
        }
    }
    $source_updates = @()
    ls -Path $Source | Where-Object {$_.Name -match "-" } | ForEach-Object{
        $full_main_path = "$Source\$($_.Name)"
        ls -Path "$Source\$($_.Name)" | ForEach-Object{
            $source_updates+=[PsCustomObject]@{
                source_file = $_.Name
                source_LastWriteTime = $_.LastWriteTime
                source_location = $full_main_path
            }
        }
    }
    $comparison = Join-Object -Left $updates -Right $source_updates -LeftJoinProperty update_file -RightJoinProperty source_file -Type AllInLeft
    $comparison | foreach-object {$_ |  Add-Member -MemberType NoteProperty -Name UpToDate -Value ($_."update_LastWriteTime" -eq $_."source_LastWriteTime") -Force} 
    $comparison | Where-Object {$_.UpToDate -eq $False}| foreach-object{
        $_.update_file
        Copy-Item -Path "$source_location\$($_.update_file)" -Destination "$update_location\$($_.update_file)"
    }
    $result = $comparison | Select-Object "update_file", "update_LastWriteTime", "update_location", "UpToDate"
    return $result
} 
$Destination = @(
    @{
        folder = "Destination General Folder"
        subfolder = @("SubFolder to update")
    }
)
update-files -source "Principal Location Here" -Destination $Destination