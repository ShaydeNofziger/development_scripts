# This script is designed to be included in your ~/.bashrc or equivalent file loaded on bash startup.
# Retrieves the URL for the GitHub page of a project cloned from GitHub and opens it in the default browser.
alias github=GitHub
function GitHub()
{
    if [ ! -d .git ] ; 
        then echo "ERROR: This isnt a git directory" && return false; 
    fi
    git_url=`git config --get remote.origin.url`
    if [[ $git_url != https://github* ]] ;
        then echo "ERROR: Remote origin is invalid" && return false;
    fi
    url=${git_url%.git}
    open $url
}
