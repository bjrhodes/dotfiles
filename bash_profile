[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# If PS1 is not set at all, this is not an interactive
# shell and we should not mess with it.
if [ -n "$PS1" ]; then

    export CLICOLOR=1
    export LSCOLORS=dxfxcxdxbxegedabagacad
    alias l="ls -lh"
    alias servedir="php -S localhost:3000"

    # Brew's bash completion
    #if [ -f $(brew --prefix)/etc/bash_completion ]; then
    #  . $(brew --prefix)/etc/bash_completion
    #fi
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
               return 0
       fi
       echo -e "(${gitver}) "
     }

     branch_color ()
     {
             if git rev-parse --git-dir >/dev/null 2>&1
             then
                     color=""
                     if git diff --quiet 2>/dev/null >&2
                     then
                             color="${c_green}"
                     else
                             color=${c_red}
                     fi
             else
                     return 0
             fi
             echo -ne $color
     }





    MYPSDIR_AWK=$(cat << 'EOF'
      BEGIN { FS = OFS = "/" }
      {
         if (length($0) > 16 && NF > 4)
            print $1,$2,".." NF-4 "..",$(NF-1),$NF
         else
            print $0
      }
      EOF
      )

      # my replacement for \w prompt expansion
      export MYPSDIR='$(echo -n "${PWD/#$HOME/~}" | awk "$MYPSDIR_AWK")'

      # the fancy colorized prompt: [0 user@host ~]%
      # return code is in green, user@host is in bold/white
      export PS1='[\[\033[1;32m\]$?\[\033[0;0m\] \[\033[0;1m\]\u@\h\[\033[0;0m\] $(eval "echo ${MYPSDIR}")]% '

      # set x/ssh window title as well
      export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} $(eval "echo ${MYPSDIR}")\007"'

    export PS1='\[${grey}\]BJR-MBP:.\[$(branch_color)\]$(parse_git_branch)\[${magenta}\]@\[${yellow}\]$(eval "echo ${MYPSDIR}")\[${sgr0}\]: '
fi
