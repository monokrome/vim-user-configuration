This is part of my Vim configuration, which uses Pathogen. If you
are interested in using this - please install pathogen by following
the documentation [here](https://github.com/tpope/vim-pathogen).

After installing pathogen, I usually do the follow - as I prefer to
avoid having a .vimrc file completely:

  echo "call pathogen#infect()" > ~/.vim/autoload/pathogen_init.vim

This module can now be cloned into ~/.vim/bundles and the settings
inside of it will automatically be applied via pathogen. I prefer
to manage ~/.vim/bundles through a piece of software callled
[git slave](http://gitslave.sourceforge.net/) - which acts much
like submodules. The difference is that it doesn't freeze the
modules at a specific version.

