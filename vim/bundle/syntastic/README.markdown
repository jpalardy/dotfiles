                   ,
                  / \,,_  .'|
               ,{{| /}}}}/_.'            _____________________________________________
              }}}}` '{{'  '.            /                                             \
            {{{{{    _   ;, \          /            Ladies and Gentlemen,              \
         ,}}}}}}    /o`\  ` ;)        |                                                |
        {{{{{{   /           (        |                 this is ...                    |
        }}}}}}   |            \       |                                                |
       {{{{{{{{   \            \      |                                                |
       }}}}}}}}}   '.__      _  |     |    _____             __             __  _      |
       {{{{{{{{       /`._  (_\ /     |   / ___/__  ______  / /_____ ______/ /_(_)____ |
        }}}}}}'      |    //___/   --=:   \__ \/ / / / __ \/ __/ __ `/ ___/ __/ / ___/ |
    jgs `{{{{`       |     '--'       |  ___/ / /_/ / / / / /_/ /_/ (__  ) /_/ / /__   |
         }}}`                         | /____/\__, /_/ /_/\__/\__,_/____/\__/_/\___/   |
                                      |      /____/                                    |
                                      |                                               /
                                       \_____________________________________________/




Syntastic is a syntax checking plugin that runs files through external syntax
checkers and displays any resulting errors to the user. This can be done on
demand, or automatically as files are saved. If syntax errors are detected, the
user is notified and is happy because they didn't have to compile their code or
execute their script to find them.

At the time of this writing, syntax checking plugins exist for applescript, c,
coffee, cpp, css, cucumber, cuda, docbk, erlang, eruby, fortran,
gentoo_metadata, go, haml, haskell, html, javascript, json, less, lua, matlab,
perl, php, puppet, python, rst, ruby, sass/scss, sh, tcl, tex, vala, xhtml,
xml, xslt, yaml, zpt

Screenshot
----------

Below is a screenshot showing the methods that Syntastic uses to display syntax
errors.  Note that, in practise, you will only have a subset of these methods
enabled.

![Screenshot 1](https://github.com/scrooloose/syntastic/raw/master/_assets/screenshot_1.png)

1. Errors are loaded into the location list for the corresponding window.
2. When the cursor is on a line containing an error, the error message is echoed in the command window.
3. Signs are placed beside lines with errors - note that warnings are displayed in a different color.
4. There is a configurable statusline flag you can include in your statusline config.
5. Hover the mouse over a line containing an error and the error message is displayed as a balloon.
6. (not shown) Highlighting errors with syntax highlighting. Erroneous parts of lines can be highlighted.

Installation
------------

Installing syntastic is easy but first you need to have the pathogen plugin installed.  If you already
have pathogen working then skip Step 1 and go to Step 2.

Step 1: Install pathogen.vim
----------------------------

First I'll show you how to install tpope's [pathogen.vim](https://github.com/tpope/vim-pathogen) so that 
it's easy to install syntastic.  Do this in your Terminal so that you get the pathogen.vim file 
and the directories it needs:

    mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -so ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

Next you *need to add this* to your ~/.vimrc:

        call pathogen#infect()

Step 2: Install syntastic as a pathogen bundle
----------------------------------------------

You now have pathogen installed and can put syntastic into ~/.vim/bundle like this:
    

    cd ~/.vim/bundle
    git clone https://github.com/scrooloose/syntastic.git

Quit vim and start it back up to reload it, then type:

    :Helptags

If you get an error when you do this, then you probably didn't install pathogen right.  Go back to
step 1 and make sure you did the following:

1. Created both the ~/.vim/autoload and ~/.vim/bundle directories.
2. Added the "call pathogen#infect()" line to your ~/.vimrc file
3. Did the git clone of syntastic inside ~/.vim/bundle
4. Have permissions to access all of these directories.


Google group
------------

To get information or make suggestions check out the [google group](https://groups.google.com/group/vim-syntastic).


FAQ
---

__Q. I installed syntastic but it isn't reporting any errors ...__

A. The most likely reason is that the syntax checker that it requires isn't installed. For example: python requires either `flake8`, `pyflakes` or `pylint` to be installed and in `$PATH`. To see which executable is required, just look in `syntax_checkers/<filetype>.vim`.  Note that aliases do not work; the actual executable must be available in your `$PATH`.  Symbolic links are okay.

Another reason it could fail is that the error output for the syntax checker may have changed. In this case, make sure you have the latest version of the syntax checker installed. If it still fails then create an issue - or better yet, create a pull request.

__Q. Recently some of my syntax checker options have stopped working...__

A. The options are still there, they have just been renamed. Recently, almost all syntax checkers were refactored to use the new `syntastic#makeprg#build()` function. This made a lot of the old explicit options redundant - as they are now implied. The new implied options usually have slightly different names to the old options.

e.g. Previously there was `g:syntastic_phpcs_conf`, now you must use `g:syntastic_php_phpcs_args`.

See `:help syntastic-checker-options` for more information.

__Q. How can I pass additional arguments to a checker?__

A. Almost all syntax checkers use the `syntastic#makeprg#build()` function. Those checkers that do can be configured using global variables. The general form of the global args variables are:

`syntastic_[filetype]_[subchecker]_args`

So, If you wanted to pass "--my --args --here" to the ruby mri checker you would add this line to your vimrc:

`let g:syntastic_ruby_mri_args="--my --args --here"`

See `:help syntastic-checker-options` for more information.

__Q. Syntastic supports several checkers for my filetype - how do I tell it which one(s) to use?__

A. Stick a line like this in your vimrc:

`let g:syntastic_<filetype>_checkers=['<checker-name>']`

To see the list of checkers for your filetype, look in `syntax_checkers/<filetype>/`.

e.g. Python has the following checkers: `flake8`, `pyflakes`, `pylint` and a native `python` checker.

To tell syntastic to use `pylint`, you would use this setting:

`let g:syntastic_python_checkers=['pylint']`

Some filetypes, like PHP, have style checkers as well as syntax checkers. These can be chained together like this:

`let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']`

This is telling syntastic to run the `php` checker first, and if no errors are found, run `phpcs`, and then `phpmd`.

__Q. How can I jump between the different errors without using the location list at the bottom of the window?__

A. Vim provides several built in commands for this. See `:help :lnext` and `:help :lprev`.

If you use these commands a lot then you may want to add shortcut mappings to your vimrc, or install something like [unimpaired](https://github.com/tpope/vim-unimpaired) - which provides such mappings (among other things).

__Q. A syntax checker is giving me unwanted/strange style tips??__

A. Some filetypes (e.g. php) have style checkers as well as syntax checkers. You can usually configure the options that are passed to the style checkers, or just disable them. Take a look at the syntax checker integration file (e.g. `syntax_checkers/php.vim`) to see what options are available.
