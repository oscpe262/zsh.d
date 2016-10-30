## ALIASES
  ## MODIFIED COMMANDS

    alias cd..='cd ..'
    alias cp='cp -av'
    alias df='df -h'
    alias diff='colordiff'              # requires colordiff package
    alias dir='dir --color=auto'
    alias grep='grep --color=tty -d skip'
    alias mkdir='mkdir -p -v'
    alias ping='ping -c 5'
    alias less='most'
    alias ls='ls -hF --color=auto'
    alias lr='ls -R'                    # recursive ls
    alias ll='ls -alh'
    alias la='ls -A'
    alias lm='la | less'
    alias mv='mv -v'
    alias rsync='rsync -vh --progress'

  ## APPLICATION ALIASES
    alias nano='nano -w'
    alias emacs='emacsclient -nw'
    alias emc='emacsclient -nc'
    alias g++='g++ -std=c++14 -Wall -Wextra -Werror -fdiagnostics-color=always'
    alias g11='g++ -std=c++11 -Wall -Wextra -Werror -fdiagnostics-color=always'
    alias gcc='gcc -Wall -Wextra -std=c99 -pedantic -fdiagnostics-color=always -g'
    alias clock='tty-clock -cBC 3 -f %Y-%m-%d'
    alias latexmk='latexmk -pdf -pvc'

  ## MISC ALIASES
    alias cls='reset'
    alias fucking='sudo'
    alias ponysay='ponysay -Wi'
    #alias urar='unrar e *.rar'
    #alias uprar='unrar e *.part01.rar'

  ## PRIVILEGED ACCESS
    alias reboot='sudo reboot'
    alias mount='sudo mount'
    alias umount='sudo umount'
    alias chown='sudo chown'
    alias chmod='sudo chmod'

  ## PACMAN ALIASES
    alias pacman='sudo pacman'
    alias pac='yaourt -S'      # default action     - install one or more packages
    alias pacu='pacman -Syu'   # '[u]pdate'         - upgrade all packages to their newest version
    alias pacs='yaourt -Ss'    # '[s]earch'         - search for a package using one or more keywords
    alias paci='pacman -Si'    # '[i]nfo'           - show information about a package
    alias pacr='pacman -R'     # '[r]emove'         - uninstall one or more packages
    alias pacl='pacman -Sl'    # '[l]ist'           - list all packages of a repository
    alias pacll='pacman -Qqm'  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
    alias paclo='pacman -Qdt'  # '[l]ist [o]rphans' - list all packages which are orphaned
    alias paco='pacman -Qo'    # '[o]wner'          - determine which package owns a given file
    alias pacf='pacman -Ql'    # '[f]iles'          - list all files installed by a given package
    alias pacc='pacman -Sc'    # '[c]lean cache'    - delete all not currently installed package files
    alias pacm='makepkg -fci'  # '[m]ake'           - make package from PKGBUILD file in current directory
    alias paccurrupt='find /var/cache/pacman/pkg -name '\''*.part.*'\'''
    alias pactest='pacman -Sql testing | xargs pacman -Q 2>/dev/null'

    alias pS='pacman -S --noconfirm'
    alias pSs='pacman -Ss'
    alias pR='pacman -Rns'
    alias pU='pacman -U'

    alias yS='yaourt -S --noconfirm --needed'
    alias ySs='yaourt -Ss'
    alias update='yaourt -Syua'
    alias refresh='pacman -Syy'
