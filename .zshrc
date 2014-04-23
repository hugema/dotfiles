# .zshrc : interactive shell commands
stty pass8 -ixon

if [ -x /usr/bin/dircolors -o -x /usr/local/bin/dircolors ]
then
  if [ -r ~/.dir_colors ]
  then
    eval "`dircolors ~/.dir_colors`"
  elif [ -r /etc/dir_colors ]
  then
    eval "`dircolors /etc/dir_colors`"
  fi
fi

export LESS="-aciMXrz-2PM?f%f:stdin.?m (file %i of %m?x, next\:%x.).?lj Line %lj?L/%L..?e (END):?pj (%pj\%)..\$P=?f%f:stdin.?lj Line %lj?L/%L..?bj Byte %bj?B/%B..?e (END):?pj (%pj\%).."
export LESSCHARSET=latin1

bindkey -e

export PS1="%n@%U%m%u %~%# "
export PS2="> "
if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "screen-w" -o "$TERM" = "xterm" -o "$TERM" = "xterm-color" -o "$TERM" = "xterm-debian" -o "$TERM" = "rxvt" -o "$TERM" = "cons25" ]
then
  autoload colors; colors
  export PS1="%{[31;1m%}%n%{[0m[33;1m%}@%{[37;1m%}%m:%{[32;1m%}%~%{[0m[33;1m%}%#%{[0m%} "
fi

if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "screen-w" ]
then
  bindkey '^[[1~' beginning-of-line       # Home 
  bindkey '^[[4~' end-of-line             # End  
  bindkey '^[[3~' delete-char             # Del
  bindkey '^[[2~' overwrite-mode          # Insert  
  bindkey '^[[5~' history-search-backward # PgUp  
  bindkey '^[[6~' history-search-forward  # PgDn  
fi

if [ "$TERM" = "xterm" -o "$TERM" = "xterm-color" -o "$TERM" = "xterm-debian" ]
then
  if [ "$COLORTERM" != "" -a "$UNAME" = "Linux" ]
  then
    export TERM=xterm-debian
  fi
  bindkey '^[[H'  beginning-of-line       # Home 
  bindkey '^[[F'  end-of-line             # End  
  bindkey '^[[3~' delete-char             # Del
  bindkey '^[[2~' overwrite-mode          # Insert
  bindkey '^[[5~' history-search-backward # PgUp    
  bindkey '^[[6~' history-search-forward  # PgDn
fi

if [ "$TERM" = "rxvt" ]
then
  export TERM="xterm"
  bindkey '^[[1~' beginning-of-line       # Home 
  bindkey '^[[4~' end-of-line             # End  
  bindkey '^[[3~' delete-char             # Del
  bindkey '^[[2~' overwrite-mode          # Insert
  bindkey '^[[5~' history-search-backward # PgUp    
  bindkey '^[[6~' history-search-forward  # PgDn
  echo -en '\033>'
fi 

bindkey '^Q'    quoted-insert             # C-q

cdpath=(~)

unsetopt beep
setopt   brace_ccl
setopt   bsd_echo
setopt   cdable_vars
unsetopt clobber
unsetopt complete_aliases
setopt   csh_junkie_loops 
setopt   csh_junkie_quotes
unsetopt err_exit
setopt   exec
unsetopt flow_control
setopt   function_argzero
setopt   hash_cmds
setopt   hash_dirs
setopt   hash_list_all
unsetopt ignore_braces
unsetopt ignore_eof
setopt   interactive_comments
unsetopt ksh_arrays
unsetopt ksh_option_print
setopt   local_options
setopt   mail_warning
setopt   multios
unsetopt over_strike
setopt   path_dirs
setopt   posix_builtins
setopt   print_exit_value
unsetopt rm_star_silent
#  prompt
unsetopt prompt_cr
setopt   prompt_subst
unsetopt rc_expand_param
setopt   rc_quotes
setopt   rcs
unsetopt sh_option_letters
setopt   short_loops
unsetopt single_line_zle
unsetopt sun_keyboard_hack
setopt   unset
unsetopt verbose
unsetopt xtrace
setopt   zle
#  generation de nom de fichier
setopt   bad_pattern          # pattern de fichier pas bonne -> erreur
setopt   chase_links          # etend les symlinks vers leurs directions
setopt   csh_null_glob        # ne dit rien si une pattern de fichier ne matche avec rien
setopt   equals               # substitue les =
setopt   extended_glob        # #, ~, ^ dans les noms de fichiers : patterns
setopt   glob                 # autorise la generation
unsetopt glob_assign          # generation de plusieurs nom cree un tableau
setopt   glob_subst           # le resul d'une substitution (varenv, alias) est utilisable
setopt   glob_dots            # pas besoin d'un . en debut de nom pour matcher les fichiers caches
setopt   magic_equal_subst    # id=expr -> expr est etendue
unsetopt mark_dirs            # pas de / lors de l'extension de noms de rep
unsetopt nomatch              # genere une erreur si pattern matche avec rien
unsetopt   null_glob          # si pattern matche avec rien, ne l'enleve pas de la liste d'arguments
setopt   numeric_glob_sort    # tri les fichiers par ordre numerique plutot que lexicographique
unsetopt sh_file_expansion    # fait l'extension de nom de fichier apres celle des parametres
#  correction orthographique
setopt   correct              # commandes
unsetopt correct_all          # tous les arguments
#  variables d'environnement
unsetopt all_export           # auto-exportation
setopt   auto_name_dirs       # var=dir_name -> ~var represente ce directory
setopt   auto_param_keys      # ?????
setopt   auto_param_slash     # var=dir_name -> completion se terminera par /
#  completion
setopt   always_last_prompt   # ?????
setopt   always_to_end        # curseur en bout de mot si completion unique
setopt   auto_list            # completion non unique affiche liste de choix
unsetopt auto_menu            # cycle sur les choix a partir du 2eme tab
setopt   menu_complete        # cycle sur les choix a partir du 1er tab
setopt   auto_remove_slash    # dernier carac d'une completion=/ + on tape un delimiteur de mot -> le / est enleve
setopt   complete_in_word     # completion au milieu des mots
setopt   glob_complete        # permet la completion des pattern
setopt   list_ambiguous       # montre les completions que si pas ambigues
unsetopt list_beep            # bip une completion ambigue
setopt   list_types           # complete en ajoutant le type de fichier
unsetopt rec_exact            # ne reconnait pas les match exact si ambiguite
setopt   append_history       # append to history file, don't overwrite.
setopt   bang_hist            # traite le ! specialement
setopt   csh_junkie_history   # ?????
unsetopt extended_history     # stocke la date des commandes dans l'history
unsetopt hist_allow_clobber   # ?????
unsetopt hist_beep            # bip si ne trouve pas l'entree dans l'history
setopt   hist_ignore_dups     # jamais 2 fois de suite la meme commande
unsetopt hist_ignore_space    # cmd commence par ' ' -> pas d'history
setopt   hist_no_store        # pas d'history pour la commande history
setopt   hist_verify          # renvoi la cmd ds l'editeur apres une history substitution
setopt   auto_cd              # commande invalide + directory valide -> cd
setopt   auto_pushd           # cd -> push le dir d'ou l'on vient sur la pile
setopt   pushd_ignore_dups    # ignore les doublons dans la pile
setopt   pushd_silent         # n'affiche pas la pile apres un pushd/popd
setopt   pushd_to_home        # pushd = pushd $HOME
setopt   auto_resume          # 'resume' sur les commandes d'un mot
unsetopt bgnice               # background process sont nice 5
unsetopt hup                  # envoi un HUP aux fils quand le shell exit
setopt   long_list_jobs       # format long pour la liste des jobs
setopt   monitor              # autorise le control de job
setopt   notify               # reporte immediatement le statut d'un job en tache de fond

export HISTORY=10000
export SAVEHIST=4000
export HISTFILE=$HOME/.history
export MAIL=/var/spool/mail/$USERNAME

compctl -x 's[-] p[1],w[1,-s] p[2]' -k signals -- kill
compctl -c man which killall exec
compctl -k hostnames -x 'c[-1,-l]' -u -- rlogin rsh
compctl -g '*(-/)' cd
compctl -g '*' -x 'W[2,-*r*]' -g '*(/)' -- rm
compctl -g '*.Z *.gz *.tgz' + -g '*' zcat gunzip
compctl -g '*.tar.Z *.tar.gz *.tgz *.tar.bz2' + -g '*' tar
compctl -g '*.zip *.ZIP' + -g '*' unzip
compctl -g '*.rar' + -g '*' unrar
compctl -g '*.bz2' + -g '*' bunzip2
compctl -g '*.dvi' + -g '*' xdvi dvips
compctl -g '*.xls *.xslx *.csv' + -g '*' gnumeric
compctl -g '*.pdf' + -g '*' evince
