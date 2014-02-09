set backup 
set writebackup

" This prevents some file watches from going nuts! (IE, @brunch)
set backupcopy=yes

set backupdir=~/.vim/tmp/backup,~/.tmp/backup,~/tmp/backup,/var/tmp/backup,/tmp 
set backupskip=/tmp/*,/private/tmp/* 

set undofile
set undodir=~/.vim/tmp/undo,~/.tmp/undo,~/tmp/undo,/var/tmp/undo,/tmp 

set directory=~/.vim/tmp/swap,~/.tmp/swap,~/tmp/swap,/var/tmp/swap,/tmp 
