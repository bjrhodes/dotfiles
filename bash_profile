export PATH="./node_modules/.bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$(/usr/libexec/java_home -v 1.8):$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="$PATH:~/Library/Python/2.7/bin"
export PATH="$PATH:~/.composer"
export PATH="$PATH:/usr/local/Cellar/node/10.9.0/bin"
export PATH="$PATH:/Users/barry/Library/Android/sdk/platform-tools"
export PATH="$PATH:/Users/barry/Library/Android/sdk/tools"
export PATH="/usr/local/bin:$PATH" # prefer homebrew binaries
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`;
alias servedir="php -S localhost:3000"

# Credit http://stackoverflow.com/a/2514279
alias unmerged="git branch --no-merged"

grey=`tput setaf 7`
cyan=`tput setaf 6`
red=`tput setaf 1`
green=`tput setaf 2`
sgr0=`tput sgr0`
magenta=$(tput setaf 5)
yellow=$(tput setaf 3)

 parse_git_branch ()
 {
   if git rev-parse --git-dir >/dev/null 2>&1
   then
           gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
   else
           gitver="no-repo"
   fi
   echo -e "(${gitver})"
 }

 branch_color ()
 {
         if git rev-parse --git-dir >/dev/null 2>&1
         then
                 color=""
                 if git diff --quiet 2>/dev/null >&2
                 then
                         color="${green}"
                 else
                         color=${red}
                 fi
         else
                 color=${red}
         fi
         echo -ne $color
 }

export PS1='\[${green}\]\u\[${magenta}\]@\[${yellow}\]BJR-MBP \[$(branch_color)\]$(parse_git_branch)\[${magenta}\]@\[${yellow}\]\w\[${sgr0}\] \n: '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
