alias dirsize=GetDirectorySize
function GetDirectorySize()
{
    find . -type f -exec ls -l {} \; | awk '{sum += $5} END {print sum}'
}

