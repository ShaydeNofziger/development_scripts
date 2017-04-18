# This script is designed to be included in your ~/.bashrc or equivalent file loaded on bash startup.
# Retrieves the size on disk value in bytes for the working directory.
alias dirsize=GetDirectorySize
function GetDirectorySize()
{
    find . -type f -exec ls -l {} \; | awk '{sum += $5} END {print sum}'
}

