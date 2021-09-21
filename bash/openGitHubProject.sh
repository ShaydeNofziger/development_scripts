# This script is designed to be included in your ~/.bashrc or equivalent file loaded on bash startup.
# Retrieves the URL for the GitHub page of a project cloned from GitHub and opens it in the default browser.
alias github=GitHub
function GitHub()
{
    if [ ! -d .git ] ; 
        then echo "ERROR: This isnt a git directory" && return false; 
    fi
    git_url=`git config --get remote.origin.url`

    if [[ "${git_url}" == git@github* ]]; then
	    repo_owner=`echo "${git_url}" | sed -Ene 's#git@github.com:([^/]*)/(.*).git#\1#p'`
	    repo_name=`echo "${git_url}" | sed -Ene 's#git@github.com:([^/]*)/(.*).git#\2#p'`
	    url="https://github.com/${repo_owner}/${repo_name}.git"
    elif [[ "${git_url}" == https://github* ]]; then
	    url=${git_url%.git}
    else
	    echo "ERROR: Remote origin is invalid" && return false;
    fi
    
    if [[ uname == 'Linux' ]]; then 
    	xdg-open "${url}"
    elif [[ uname == 'Darwin' ]]; then
		open "${url}"
    fi
}
