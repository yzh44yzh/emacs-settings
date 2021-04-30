# Refcard

C-x means character eXtend (followed by one character)
M-x means command eXtend (followed by a command)


## General

C-g    keyboard-quit
C-u    universal-argument
C-z    undo    (default is C-x u)
C-x z  repeat  (C-x zzz -- повторить 3 раза)


## Files & Buffers

C-x C-f  find-file  Open
C-x 4 f  find-file-other-window

M-s M-s  save-buffer        Save (default is C-x C-s)
C-x s    save-some-buffers  Save all
C-x C-w  write-file         Save as

C-;      ido-switch-buffer  (default is C-x b)
C-x 4 b  switch-to-buffer-other-window

C-x C-b  ibuffer      (shadows list-buffers)
C-x C-k  kill-buffer  (default is C-x k)

C-x C-c  save-buffers-kill-terminal  Exit emacs

M-x      clean-buffer-list


## Move

C-a    move-beginning-of-line
C-e    move-end-of-line
M-m    back-to-indentation  (к началу отступа)

C-M-a  beginning-of-defun
C-M-e  end-of-defun

C-M-f  forward-sexp
C-M-b  backward-sexp
C-M-u  backward-up-list  (к началу sexp)

M-a    backward-sentence
M-e    forward-sentence

M-{    backward-paragraph
M-}    forward-paragraph

M-<    beginning-of-buffer
M->    end-of-buffer

M-g g  goto-line

C-v    scroll-up
M-v    scroll-down

C-l    recenter-top-bottom (line under cursor)
C-M-l  reposition-window  (smart reposition, make current definition visible)
M-r    move-to-window-line-top-bottom (move cursor)

M-x    follow-mode  (for 2 vertical windows)


## Edit

C-j      my-new-line         (shadows newline-and-indent)
C-S-j    delete-indentation  (default is M-^)
C-d      duplicate-line      (shadows delete-char)

C-M \    indent-region
C-M-q    indent-sexp
C-x Tab  indent-rigidly

M-\      delete-horizontal-space
M-Space  just-one-space
C-x C-o  delete-blank-lines

C-t      transpose-char
M-t      transpose-words
C-M-t    transpose-sexps
C-x C-t  transpose-lines

M-l      downcase-word
M-u      upcase-word
M-c      capitalize-word

M-q      fill-paragraph
C-x i    insert-file  (add file content)

M-x      auto-fill-mode (автоматический перенос строк)
M-x      sort-lines


## Mark (Select)

C-Space      set-mark-command
C-u C-Space  pop-mark         (jump to the mark in current buffer)
C-x C-Space  pop-global-mark  (jump to the mark globally)
C-x C-x      exchange-point-and-mark

M-@    mark-word
C-M-@  mark-sexp
C-M-h  mark-defun
M-h    mark-paragraph
C-x h  mark-whole-buffer


## Kill & Yank (Cut, Copy, Paste)

S-delete  my-cut   (shadows kill-region)
C-insert  my-copy  (shadows kill-ring-save)
S-insert  yank
M-y       yank-pop (paste from history)

M-d    kill-word
C-M-k  kill-sexp
C-k    kill-line
C-y    kill-whole-line  (shadows yank)
M-k    kill-sentence


## Search & Replace

C-s   isearch-forward (i means incremental)
C-r   isearch-backward
C-s C-s  search again (то же слово)

C-M-s  isearch-forward-regexp

C-M-r  query-replace (default is M-%)
  y (space)      replace the current match and move on
  n (backspace)  skip the current match and move on
  q (return)     exit without doing any more replacements
  ,  replace this match, don't move (y or n to move on)
  .  replace this match, then exit
  ^  back up to previous match
  !  replace all remaining matches with no more questions.

M-x  replace-string
M-x  query-replace-regexp
M-x  occur (выводит результаты поиска в отдельном буфере)

M-x  replace-string<Return>old-string<Return>new-string

C-M-s  grep
M-s s  grep-word-at-point


## Dev

C-x C-e   eval-last-sexp
C-M-x     eval-defun

C-Return  complete-symbol
M-/       dabbrev-expand (expand word)
C-x /     comment-line
M-(       insert-parentheses (добавялет пару скобок и курсор между ними)

M-.       xref-find-definitions (go to definition, нужна таблица тэгов TAGS)
C-x 4 .   xref-find-definitions-other-window
M-,       xref-pop-marker-stack (go back to where M-. was invoked)

M-x visit-tags-table
M-x tags-search RET regexp RET (Поиск regexp во всех файлах в выбранной таблице тегов.)
M-x tags-query-replace


## Windows

C-x 0  delete-window
C-x 1  delete-other-windows
C-x 2  split-window-vertically
C-x 3  split-window-horizontally
C-o    other-window (default is C-x o)

C-x +  balance-windows (выровнять размеры всех окон)

C-M-v  scroll-other-window
C-x ^  enlarge-window
C-x {  shrink-window-horizontally
C-x }  enlarge-window-horizontally


## Help

C-h k    key
C-h f    function
C-h v    variable
C-h m    mode
C-h a    apropos
C-h C-h  help-for-help


## Registers & Bookmarks

C-x r SPC reg  point-to-register
C-x r j reg    jump-to-register

C-x r s reg    copy-to-register (s - save)
C-x r i reg    insert-register

M-x view-register reg

C-x r m        bookmark-set (m - memo)
C-x r b name   bookmark-jump (b - bookmark)
C-x r l        list-bookmarks


## Minibuffer

M-p  previous-history-element
M-n  next-history-element
M-r  previous-matching-history-element
M-s  next-matching-history-element


## Macros

F5  start-kbd-macro  Start recording macro
F6  end-kbd-macro    Stop recording macro
F7  call-last-kbd-macro

M-x name-last-kbd-macro (задает имя функции, по которому можно будет запустить макрос)
M-x insert-kdb-macro    (вставить код макроса в текущий буфер)


## org-mode & markdown

C-c C-n  outline-next-visible-heading  (след заголовок)
C-c C-p  outline-previous-visible-heading
C-c C-f  outline-forward-same-level  (след заголовок того же уровня)
C-c C-b  outline-backward-same-level
C-c C-u  outline-up-heading  (заголовок выше по уровню)


## Dired

M-x dired

+  dired-create-directory
i  dired-maybe-insert-subdir  (показать содержимое дочернего каталога)
g  revert-buffer  (обновить содержимое буфера)

f  dired-find-file  (открыть файл, Ret работает так же)
o  dired-find-file-other-window
C-o  dired-display-file  (открывает файл в отдельном окне, но не выбирает это окно)

m  dired-mark
u  dired-unmark
%m dired-mark-files-regexp  (помечает файлы по регулярному выражению)

С dest Return  dired-do-copy (копирует помеченые файлы в каталог dest)
R dest Return  dired-do-rename (перемещает помеченые файлы в каталог dest)
D              dired-do-delete (удаляет помеченые файлы)
%C old_name_regexp Ret new_name_regexp Ret (copy files)
%R old_name_regexp Ret new_name_regexp Ret (rename files)

=  dired-diff  (diff file at point with file at mark)

d  dired-flag-file-deletion (поставить флаг удаления)
u  dired-unmark (убрать флаг удаления)
%d dired-flag-files-regexp (помечает для удаления файлы по регулярному выражению)
x  dired-expunge запуск (удаление с запросом подтверждения)


## Shell

M-x shell

M-! shell-command (запустить команду, показать вывод в буфере)
M-| shell-command-on-region (передать region на вход команды)


## Projectile

C-c p f    projectile-find-file  (in current project)
C-c p b    projectile-switch-to-buffer
C-c p e    projectile-recentf  (recent files)

C-c p d    projectile-find-dir  (open dir in dired)
C-c p D    projectile-dired  (root dir in dired)

C-c p p    projectile-switch-project
C-c p q    projectile-switch-open-project

C-c p j    projectile-find-tag
C-c p R    projectile-regenerate-tags
C-c p s g  projectile-grep


## neotree

SPC or RET or TAB
Open current item if it is a file.
Fold/Unfold current item if it is a directory.

U Go up a directory

g Refresh

A Maximize/Minimize the NeoTree Window

H Toggle display hidden files

O Recursively open a directory

C-c C-n  Create a file or create a directory if filename ends with a ‘/’
C-c C-d  Delete a file or a directory.

C-c C-r  Rename a file or a directory.
C-c C-p  Copy a file or a directory.

C-c C-c  Change the root directory.
