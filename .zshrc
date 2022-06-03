# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export PATH="$HOME/.fastlane/bin:$PATH"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

DISABLE_AUTO_TITLE="true"

plugins=(dirhistory sublime)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


#sets tab title in ITerm to current directory
#DISABLE_AUTO_TITLE="true"
tab_title() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
add-zsh-hook precmd tab_title


export HISTSIZE=1000

#save history after logout
export SAVEHIST=1000

export HISTFILE=~/.zhistory

#export C_INCLUDE_PATH=/usr/local/include
#export CPLUS_INCLUDE_PATH=/usr/local/include

setopt INC_APPEND_HISTORY

setopt HIST_IGNORE_DUPS

setopt inc_append_history

# Reloads the history whenever you use it
setopt share_history

#set vim editing mode
set -o vi

alias vi='vim'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias edit='subl'
alias EDITOR=subl
alias HOMEBREW_EDITOR=subl



export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# export NVM_DIR="/Users/bretsko/.nvm"
#     . "/Users/bretsko/.nvm/nvm.sh"  # This loads nvm
    
# Configs
alias zshrc='edit ~/.zshrc'
alias zshrc_dev='edit ~/.zshrc_osxdev'
alias zshrc_git='edit ~/.zshrc_git'
alias zshrc_ubuntu='edit ~/.zshrc_ubuntu'
alias zshrc_py='edit ~/.zshrc_py'
alias zshrc_tensor='edit ~/.zshrc_tensor'

alias zshrc_temp='edit ~/.zshrc_temp'
alias zshrc_hlp='edit ~/.zshrc_hlp'

alias zshrc_stxnet='edit ~/.zshrc_stxnet'
alias zshrc_pattern='edit ~/.zshrc_pattern'
alias zshrc_flask='edit ~/.zshrc_flask'
alias zshrc_nltk='edit ~/.zshrc_nltk'

alias zshrc_textblob='edit ~/.zshrc_textblob'

alias zshrc_py='edit ~/.zshrc_py'
alias zshrc_code='edit ~/.zshrc_codebook'

alias shrc='. ~/.zshrc'
alias vimrc='edit ~/.vimrc'
alias tmuxrc='edit ~/.tmux.conf'
alias makerc='edit Makefile'
alias lldbrc='edit ~/.lldbinit'
alias tmuxrc='edit ~/.tmux.conf'
alias inputrc='edit ~/.inputrc'

# Tmux
alias tmuxattach="tmux attach"
alias tmuxnew='tmux new -s'
alias tmuxattach-or-create='tmux new-session -A -s main'

alias rebuild='make rebuild'
alias clean='make clean'
alias maker='make target && ./target'
alias rebuildr='rebuild target && ./target'
alias make='make -j2'
alias grep='grep --color=auto -i'
alias grepword='grep -wHR $1 . 2>/dev/null'

alias gitbook-editor='gksu /opt/gitbook-editor/editor &>/dev/null &'
alias openPDF='gksu evince &>/dev/null &'

openMD(){
    gksu haroopad "$1" &>/dev/null &
}


#gksu haroopad /root/Desktop/gitbooks/bretsko.gitlab.io/test.md &

alias mdGenTOC='doctoc --gitlab'

alias history='history | less'
alias hh='history | grep '
alias hhp='history | pygmentize -g'

alias df='df -Th'
alias kil9='killall -9'
alias kk='killall -9 '
alias kil='killall'
alias pp='ps -aux | grep '
alias psps='ps aux | grep '

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias rmrf='rm -Rf'


alias ls='ls -A'
alias ll='ls -ghA --color=auto'
alias lll='ls -A | less'
alias lcol='ls -ghA --group-directories-first| less'
alias dirfirst='ls -ghA --group-directories-first'


alias uu='apt-get update && apt-get dist-upgrade'
alias instal='apt-get install'
alias instals='apt-get -s install'
alias removes='apt-get -s remove'
alias du='du -ach | sort -h'

alias findCPP='find . -regex ".*\.\(c\|cc\|cpp\|cp\|cxx\|c++\|h\|hh\|hpp\|hxx\)"'
alias uncomment='awk "!( NR<20 && !/^[[:blank:]]*#.*)/ && /^[[:blank:]]*($|[/].*)/)"' 
alias uncommentALL='find . -regex ".*\.\(c\|cc\|cpp\|cp\|cxx\|c++\|h\|hh\|hpp\|hxx\)" \
-exec awk -i inplace "!( NR<20 && !/^[[:blank:]]*#.*)/ && /^[[:blank:]]*($|[/].*)/)"  {} \;'


alias gamma='xgamma -gamma'
alias ccat='pygmentize -g'


#---------------------------PROMPT-------------------------


# function powerline_precmd() {
#     PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)"
# }

# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }

# if [ "$TERM" != "linux" ]; then
#     install_powerline_precmd
# fi


#---------------------------COMPARE-------------------------



cmp_file_lines_seq() {
  diff <(nl $1) <(nl $2) | gg20 "\|<\|>"
}

cmp_files_mark_common() {
    grep -f $1 $2
}

alias openFolderHere='xdg-open . &'

openFolder(){
    xdg-open "1$" &
}


cmp_files() {
  #to be 100% sure
  #cmp --silent $1 $2 || echo "files are different"
  file1=`md5sum $1`
  file2=`md5sum $2`

  if [ "$file1" = "$file2" ]
    then
    echo "Files have the same content"
else
    echo "Files have NOT the same content"
fi
}

cmp_file_sizes() {
    A=`wc -c $1 | cut -d' ' -f1`
    B=`wc -c $2 | cut -d' ' -f1`
    if [ $A -eq $B ]
        then
        echo "same size"
    else
      echo "different size" 
  fi
}

pid() {
  ps -C $1 -o pid=
}

mm() {
 man $1 | grep  $2 -i -n
} 

sstart() { 
  service $1 start
}

sstop() { 
  service $1 stop
}

bright() {
    #echo $1 > /sys/class/backlight/acpi_video0/brightness
    xrandr --output LVDS-1 --brightness $1
}


mytty(){
  tty | sed -e "s/.*tty\(.*\)/\1/".
}

timer() {
  mytime="$(time ( $1 ) 2>&1 1>/dev/null )"
  echo "$mytime"
}

straceproc() {
  strace -t -p pid $1 -o $1.txt
}

gdbproc() {
  pidForGdb="pid $1"
  gdb --pid=pidForGdb
}

alias whichsh='ps -o args= -p $$'

mcd () {
  mkdir -p $1
  cd $1
}

gg5() {
  grep  $1 -i -A 5 -B 5
}

gg5s() {
  grep  $1 -i -A 5 -B 5 | sed -e "s/[[:space:]]\+/ /g"
}

gg20() {
  grep  $1 -i -A20 -B 20
}

gg20s() {
  grep  $1 -i -A20 -B 20 | sed -e "s/[[:space:]]\+/ /g"
}


mm5() {
 man $1 | grep  $2 -i -A 5 -B 5
}

mm5s() {
 man $1 | grep  $2 -i -A 5 -B 5 | sed -e "s/[[:space:]]\+/ /g"
}

mm20() {
 man $1 | grep  $2 -i -A20 -B 20
}

mm20s() {
 man $1 | grep  $2 -i -A20 -B 20 | sed -e "s/[[:space:]]\+/ /g"
}

mh() {
 $1 --help | grep  $2 -i -n 
} 

mh5() {
 $1 --help | grep  $2 -i -A 5 -B 5 | sed -e "s/[[:space:]]\+/ /g"
}

mh20() {
 $1 --help | grep  $2 -i -A20 -B 20 | sed -e "s/[[:space:]]\+/ /g"
}


sedNewlines(){
#read the whole file in a loop, then replaces the newline(s) with a space.

sed ':a;N;$!ba;s/\n/ /g' $1

#:a create a label 'a'
#N append the next line to the pattern space
#$! if not the last line, ba branch (go to) label 'a'
#s substitute, /\n/ regex for new line, / / by a space, /g global match (as many times as it can)

#sed will loop through step 1 to 3 until it reach the last line, getting all lines fit in the pattern space where sed will substitute all \n characters
}

trNewlines(){
  tr '\n' ' ' < $1
}

trNewlinesAll(){
  #remove the newline characters entirely:
  tr --delete '\n' < $1 > $2
}


alias filetypes='find . -type f -exec file '{}' \;'

alias columns='ls -A -C --color=auto --group-directories-first'
alias columnst='ls -A -C --color=auto --group-directories-first -t'
alias columnss='ls -A -C --color=auto --group-directories-first -S'
alias columnstr='ls -A -C --color=auto --group-directories-first -t -r'
alias columnssr='ls -A -C --color=auto --group-directories-first -S -r'

alias lssize='ls -ghA --group-directories-first --color=auto -C -S'
alias lssizer='ls -ghA --group-directories-first --color=auto -C -S -R'
alias lstime='ls -ghA --color=auto -C -t'
alias lstimer='ls -ghA --color=auto -C -t -R'

alias lsdir='ls -d */ '
alias lsdirt='ls -d */ -t'
alias lsdirtr='ls -d */ -t -r'

alias lsless='ls -ghFA | less'
alias lslesst='ls -ghFA -t | less'
alias lslesstr='ls -ghFA -t -r | less'
alias lslesss='ls -ghFA -S | less'
alias lslesssr='ls -ghFA -S -r | less'
alias lslessd='ls -ghFA --group-directories-first | less' 

alias row='ls -mA --group-directories-first --color=auto'
alias rowt='ls -mA --group-directories-first --color=auto -t'
alias rowtr='ls -mA --group-directories-first --color=auto -t -r'
alias rows='ls -mA --group-directories-first --color=auto -S'
alias rowsr='ls -mA --group-directories-first --color=auto -S -r'

alias findhere='ls -mA --group-directories-first | grep'
alias findheres='ls -mA -S --group-directories-first | grep'
alias findheret='ls -mA -t --group-directories-first | grep'

alias findsub='ls -R -mA | grep'
alias findsubs='ls -R -mA -S --group-directories-first | grep'
alias findsubt='ls -R -mA -t --group-directories-first | grep'

alias trash-show='ls -sha --color=auto ~/.local/share/Trash/'
alias trash-empty='rm -rf ~/.local/share/Trash/*'
alias wcl='wc -l'


#GTK_MODULES=""

#deleteword(){ 
#sed -i ".bak" '/$1/d' 
#}

#To remove the line and print the output to standard out:
#sed '/pattern to match/d' ./infile

#To directly modify the file (with GNU sed):
#sed -i '/pattern to match/d' ./infile

#alias 2columns='ls -lhA --color=auto -C'

#alias blah='function _blah(){ echo "First: $1"; echo "Second: $2"; };_blah'


alias grepnet='netstat -atnp | grep'
#alias hh='history | grep '

alias copyssh='cat ~/.ssh/id_rsa.pub | xclip -sel clip'
#alias hhp='cat ~/.zhistory |  pygmentize'
#alias hhp='history | pygmentize -g'
alias readLogLive='grc tail -f'

ffhere(){
 find . -name "$1" | grep "$1"
}

#findfile(){ 
#find "$2" -type f -name \"$1\" | grep "$1"
#}

findfilehere(){
 find . -type f -name "$1" | grep "$1"
}

finddir(){
 find "$2" -type d -name "*$1*" | grep "$1"
}

finddirhere(){
 find . -type d -name "*$1*" | grep "$1"
}

alias ii='ifconfig -a'

#Make search in all man pages - /usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man


#function jcurl() {
#	# $@ - accepts several variables
#    curl "$@" | json | pygmentize -l json
#}

#export -f jcurl

#function auth-jcurl() {
#    curl -H "Accept: application/json" -H "Content-Type: application/json" -H "X-User-Email: $1" -H "X-User-Token: $2" ${@:#3} | json | pygmentize -l json
#}
#export -f auth-jcurl

#${@:3} is the array of command line arguments minus the first 2, (because we’ve already used them with $1 and $2).

#We can now pass the username and access token to cURL and any additional options (which will be picked up by “$@”)

#$ auth-jcurl name@example.com a4pQnAiprk6-qczS3rn6 http://localhost:3000/api/v1/exercises


#alias fixvm='modprobe vmmon && modprobe vmw_vmci && modprobe vmnet && vmware-networks --start'
alias fixvm='vmware-modconfig --console --install-all'
# shortcut  for iptables and pass it via sudo#
#alias ipt='sudo /sbin/iptables'

# display all rules #
#alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
#alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
#alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
#alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
#alias firewall=iptlist


alias dnstop='dnstop -l 5 wlan0'
#alias vnstat='vnstat -i wlan0'
alias iftop='iftop -i wlan0'
alias tcpdump='tcpdump -i wlan0'
alias ethtool='ethtool wlan0'

#alias nn='netstat -tulanp'

#echo "127.0.0.1 $1" >> /etc/hosts

## pass options to free ## 
#alias meminfo='free -m -l -t'

## get top process eating memory
#alias psmem='ps auxf | sort -nr -k 4'
alias mem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
#alias pscpu='ps auxf | sort -nr -k 3'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

## get GPU ram on desktop / laptop## 
#alias gpumeminfo='grep  -i --color memory /var/log/Xorg.0.log'

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f "$1" ] ; then
      NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case "$1" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
*.tar.gz)    tar xvzf ./"$1"    ;;
*.tar.xz)    tar xvJf ./"$1"    ;;
*.lzma)      unlzma ./"$1"      ;;
*.bz2)       bunzip2 ./"$1"     ;;
*.rar)       unrar x -ad ./"$1" ;;
*.gz)        gunzip ./"$1"      ;;
*.tar)       tar xvf ./"$1"     ;;
*.tbz2)      tar xvjf ./"$1"    ;;
*.tgz)       tar xvzf ./"$1"    ;;
*.zip)       unzip ./"$1"       ;;
*.Z)         uncompress ./"$1"  ;;
*.7z)        7z x ./"$1"        ;;
*.xz)        unxz ./"$1"        ;;
*.exe)       cabextract ./"$1"  ;;
*)           echo "extract: '$1' - unknown archive method" ;;
esac
else
  echo "'$1' - file does not exist"
fi
fi
}

#Utilities

alias cueToFlac='cuebreakpoints $1 | shnsplit -o flac $2'

youtubeDownloadMP3() {
    youtube-dl -x --audio-format mp3 $1
}
youtubeDownloadMP3withThumbnail(){
    youtube-dl -x --embed-thumbnail --audio-format mp3
}

alias extractFromAVI='ffmpeg -i *.avi -map 0:3 -f mp3 -vn -ab 192000 music.mp3'
alias extractFromMP4='ffmpeg -i *.mp4 -f mp3 -ab 192000 -vn music.mp3'
alias extractMP3='ffmpeg -i "$1" -q:a 0 -map 0:$2 "$1.mp3"'
alias extractAudio='ffmpeg -i *.mkv -map 0:1 -vn -acodec copy audio1.aac'
alias extractAudio='ffmpeg -i *.mkv -vn -acodec copy audio1.aac'
alias convertAACtoMP3='ffmpeg -i audio.aac -acodec libmp3lame -ac 2 -ab 160 audio.mp3'

convertWAVtoMP3() {
    find . -type f -name "*wav" -exec ffmpeg -i {} {}.mp3 \;
}


source ~/.zshrc_git
source ~/.zshrc_osxdev
source ~/.zshrc_ubuntu
source ~/.zshrc_tensor
source ~/.zshrc_py

# source ~/.zshrc_stxnet
# source ~/.zshrc_nlp
# source ~/.zshrc_temp
source ~/.zshrc_flask
# source ~/.zshrc_hlp
# source ~/.zshrc_textblob
# source ~/.zshrc_nltk
# source ~/.zshrc_codebook
# source ~/.zshrc_projects



#check most used commands 
#history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

# added by Miniconda3 installer
export PATH="/Users/bretsko/anaconda2/bin:$PATH"

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:/opt/local/bin:/opt/local/sbin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
