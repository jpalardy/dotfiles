# vindent.vim

`vindent.vim` is Vim/Neovim plugin that provides indentation related *motions* and *text objects*:

1. **Motions**: jump to specific positions defined by indentations.
	- Jump to previous/next line with *same*, *less*, *more*, or *different* indentation.
	- Jump to previous/next text block with *same* indentation.
	- Jump to start/end of the current text block of same indentation.
2. **Text Objects**: selects specific lines defined by indentations.
	- Select a text block of *same* (or specified level of) indentation.
	- Select text block and a previous line with less indentation. (useful with Python function definitions)
	- Select text block, a previous, and a next line with less indentation. (useful with Lua function definitions)

This plugin is inspired by [vim-indentwise](https://github.com/jeetsukumaran/vim-indentwise)
and [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object).
`vindent.vim` is essentially a combination and reimplementation of the two
plugins, but **improved**! Here are some of the improvements and reasons why
you should switch to `vindent.vim`:

- Motions work nicely with prepending `{count}`s and normal commands such as
  `d`, `c`, and `y`. Works just like a native vim motion!
- More customizability! Chose for yourself if "*empty lines*" or "*lines with more
  indentation*" should be considered as text-block boundaries.
- Reimplemented with only about *250* lines of vimscript, where only about
  *100* lines are core implementation!

## Installation

Install using your favourite plugin manager, or use Vim's built-in package
support:
```sh
mkdir -p ~/.vim/pack/jessekelighine/start
cd ~/.vim/pack/jessekelighine/start
git clone https://github.com/jessekelighine/vindent.vim
```

## Usage and Quick Start

`vindent.vim` comes with no default keybindings.
Here is a recommended set of keybindings to put in your `.vimrc`/`init.vim`:

```vim
let g:vindent_motion_OO_prev   = '[=' " jump to prev block of same indent.
let g:vindent_motion_OO_next   = ']=' " jump to next block of same indent.
let g:vindent_motion_more_prev = '[+' " jump to prev line with more indent.
let g:vindent_motion_more_next = ']+' " jump to next line with more indent.
let g:vindent_motion_less_prev = '[-' " jump to prev line with less indent.
let g:vindent_motion_less_next = ']-' " jump to next line with less indent.
let g:vindent_motion_diff_prev = '[;' " jump to prev line with different indent.
let g:vindent_motion_diff_next = '];' " jump to next line with different indent.
let g:vindent_motion_XX_ss     = '[p' " jump to start of the current block scope.
let g:vindent_motion_XX_se     = ']p' " jump to end   of the current block scope.
let g:vindent_object_XX_ii     = 'ii' " select current block.
let g:vindent_object_XX_ai     = 'ai' " select current block + one extra line  at beginning.
let g:vindent_object_XX_aI     = 'aI' " select current block + two extra lines at beginning and end.
let g:vindent_jumps            = 1    " make vindent motion count as a |jump-motion| (works with |jumplist|).
```

With these keybindings, you can now...

1. **Vindent Motions**:
	- Jump to previous/next block with same indentation with `[=`/`]=`. ([examples](#vindent-motion-block-wise))
	- Jump to previous/next line with less indentation with `[-`/`]-`. ([examples](#vindent-motion-line-wise))
	- Jump to previous/next line with more indentation with `[+`/`]+`. ([examples](#vindent-motion-line-wise))
	- Jump to previous/next line with different indentation with `[;`/`];`. ([examples](#vindent-motion-line-wise))
	- Jump to start/end of text block with `[p`/`]p`. ([examples](#vindent-motion-block-wise))
2. **Vindent Text Objects**:
   Select text block with `ii` (*in indent*),`ai` (*an indent*), and `aI` (*an Indent*). ([examples](#vindent-text-object))

Feel free to customize the keybindings. If you wish not to use a certain
functionality, simply leave the corresponding variable undefined.

## Explanations and Examples

### Vindent Motion: line-wise

These motions are very self explanatory: move to the previous or next line with
either *same*, *less*, *more*, or *different* indentation.  These motions
operates on *entire lines* if it is prepended with a normal command such as `d`
or `c` or `y`.

For example, assume that the keybindings in [Usage](#usage-and-quick-start) are
used and consider the following python code:

```python
 1 def SumTo():
 2     print("Hello, what do you want to sum?")
 3     count = int(input("integer:"))
 4
 5     total = 0
 6     for i in range(count+1):
 7         total += i
 8
 9     print(f"This is your total: {total}")
10     return(total)
```

- If cursor is on line 3, `[-` moves it to line 1.
- If cursor is on line 7, `2[-` moves it to line 1.
- If cursor is on line 10, `[+` moves it to line 7.
- If cursor is on line 1, `2]+` moves it to line 7.

See [`doc`](doc/vindent.txt) section `vindent_Motion` for more detail and
examples.

### Vindent Motion: block-wise

These motions move the cursor to the previous or next text block with the same
indentation. All vindent motions and objects that operates block-wise contains
a two character string of `O`'s and `X`'s in their names. This string indicates
how the motion or object defines a "text block".  More precisely, they
are all named `vindent_motion_<A1><A2>_<A3>` or `vindent_object_<A1><A2>_<A3>` where...

- `<A1>` indicates whether "empty lines" are IGNORED when finding the
  boundaries of a "text block".
- `<A2>` indicates whether "lines with more indentation" are IGNORED when
  finding the boundaries of a "text block".
- `<A3>` indicates the type of motion or text object.

That is,

| `<A1><A2>` | "Empty lines" ignored? | "More-indented lines" ignored? |
| ---        | ---                    | ---                            |
| `OO`       | No                     | No                             |
| `XO`       | Yes                    | No                             |
| `OX`       | No                     | Yes                            |
| `XX`       | Yes                    | Yes                            |

Here are some examples to clear things up.  Assume that the keybindings in
[Usage](#usage-and-quick-start) are used and consider the following code:

```vim
 1 function! SumTo(number)
 2     let l:sum = 0
 3     for l:time in range(a:number)
 4         echom "This is the" l:time "time."
 5         let l:sum = l:count + l:time
 6     endfor
 7
 8     echom "The sum is" l:sum
 9     return "Hi" . a:name
10 endfunction
```

If the cursor is on line 2, then pressing `]=` 2 times moves the cursor to line
6 and 8.  This is because `]=` is mapped to `g:vindent_motion_OO_next`, in
which `OO` indicates that "empty lines" and "more-indented lines" are all
considered to be boundaries of a text block (NOT ignored).

If the cursor is on line 2, then pressing `]p` moves the cursor to line 9.
This is because `]p` is mapped to `g:vindent_motion_XX_se`, in which `XX` indicates
that "empty lines" and "more-indented lines" are all ignored, thus line 2 to
line 9 is considered to be one text block.

**Note**:

- I believe `g:vindent_motion_OO_prev` and `g:vindent_motion_OO_next` is what
  most people want, since every breakage of continuous lines with same
  indentation are considered a boundary.  But feel free to change `OO` to
  whatever setting you find the most useful.
- A similar statement is true for `g:vindent_motion_XX_ss` and `g:vindent_motion_XX_se`.
- Please refer to [`doc`](doc/vindent.txt) for more details.

### Vindent Text Object

The text objects are:

| Text Object | Mnemonics   | Description                                                                                 |
|-------------|-------------|---------------------------------------------------------------------------------------------|
| `ii`        | *in indent* | select text block of same indentation.                                                      |
| `ai`        | *an indent* | select text block of same indentation and a previous line with less indentation.            |
| `aI`        | *an Indent* | select text block of same indentation and a previous and a next line with less indentation. |

Similar to [block-wise motions](#vindent-motion-block-wise), you can specify
what is considered to be the same block by changing the `O`'s and `X`'s in the
variable name.

The text objects can take counts, which indicates how make levels up (of
indents) should be selected.  Assume that the keybindings in
[Usage](#usage-and-quick-start) are used and consider following code:

```vim
 1 function! SumTo(number)
 2
 3     let l:sum = 0
 4     for l:time in range(a:number)
 5         echom "This is the" l:time "time."
 6         let l:sum += l:time
 7     endfor
 8
 9     echom "The sum is" l:sum
10     return l:sum
11 endfunction
```

- If the cursor is on line 3, `vii` selects lines 3--10.
- If the cursor is on line 3, `vai` selects lines 1--10.
- If the cursor is on line 3, `vaI` selects lines 1--11.
- If the cursor is on line 5, `v2ii` selects lines 3--10. (one indent level up)
- If the cursor is on line 5, `v2ai` selects lines 1--10. (one indent level up, and then search for a previous line with less indentation)

If you think pressing `2` for "one indent level up" is not very intuitive,
you can put `let g:vindent_count = 0` in you `.vimrc`/`init.vim`.
This setting would change how `{count}`'s are handled as such:

- If the cursor is on line 5, `v1ii` selects lines 3--10. (one indent level up)
- If the cursor is on line 5, `v1ai` selects lines 1--10. (one indent level up, and then search for a previous line with less indentation)

For more details please refer to the [`doc`](doc/vindent.txt), section `vindent_Text_Object`.

## Change Log

See [`doc`](doc/vindent.txt) section `6. Changelog` for details.

## Licence

Distributed under the same terms as Vim itself. See `:help license`.
