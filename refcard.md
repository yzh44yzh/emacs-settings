# Refcard Minimal.

## General

C-g      abort
C-u      num argument
C-z      undo (default is C-x u)
C-u Num  repeat-count


## Files & Buffers

C-x C-f  find-file (Open)
C-x C-s  save-buffer (Save)
C-x s    save-some-buffers (Save all)
C-x i    insert-file (add file content)
C-x C-w  write-file (Save as)

C-x b    switch-to-buffer
C-x C-b  list-buffers
C-x k    kill-buffer

Custom:
C-;      ido-switch-buffer
C-x C-b  ibuffer
M-s M-s  save-buffer
C-x C-k  kill-buffer


## Moving & Editing

C-a   move-beginning-of-line
C-e   move-end-of-line
M-a   backward-sentence
M-e   forward-sentence
C-M-a beginning-of-defun
C-M-e end-of-defun
M-<   beginning-of-buffer
M->   end-of-buffer
C-v   scroll-up
M-v   scroll-down
C-l   recenter-top-bottom
M-r   move-to-window-line-top-bottom

C-j      newline-and-indent
C-t      transpose-char
M-t      transpose-words
C-x C-t  transpose-lines

C-M \    indent-region
C-x C-o  delete-blank-lines
M-\      delete-horizontal-space

Custom:
C-M-j    delete-indentation
C-M-d    duplicate-line
C-j      my-new-line
C-S-j    delete-indentation


## Marking & Killing (Select & Delete)

C-Space  set-mark-command
  C-u C-Space jump to the mark
  C-x C-x  exchange-point-and-mark

C-M-h    mark-defun
C-x h    mark-whole-buffer

C-d      delete-char
M-d      kill-word
C-k      kill-line
M-z char zap-to-char (kill to char)

Use S-Del, C-Ins, S-Inst instead of this:
C-w      kill-region (cut)
M-w      kill-ring-save (copy)
M-y      yank-pop (paste from history)

Custom:
C-x C-h mark-whole-buffer
M-w     my-copy
C-w     my-cut
C-y     kill-whole-line


## Search & Replace

C-s   isearch-forward
C-r   isearch-backward
C-M-s isearch-forward-regexp
C-M-r isearch-backward-regexp
  M-n - search for the next item in the search ring.
  M-p - search for the previous item in the search ring.

C-M-r  query-replace
  y - replace the current match.
  n - skip to the next match without replacing.
  q - exit without doing any more replacements.
  , - replace this one, dont move
  . - replace this match, then exit.
  ^ - back up to previous match
  ! - replace all remaining matches with no more questions.

Custom:
C-M-s grep
C-M-r query-replace
M-s s grep-word-at-point


## Dev

C-x C-e  eval-last-sexp
M-/  dabbrev-expand (expand word)
M-x eval-region
M-g g goto-line

Custom:
C-Return complete-symbol


## Windows

C-x 0  delete-window
C-x 1  delete-other-windows
C-x 2  split-window-vertically
C-x 3  split-window-horizontally
C-x o  other-window

Custom:
C-o    other-window


## Help

C-h k  key
C-h f  function
C-h v  variable
C-h m  mode
C-h a  apropos


## Registers & Bookmarks

C-x r SPC reg  point-to-register
C-x r j reg    jump-to-register
C-x r s reg    copy-to-register
C-x r i reg    insert-register
C-x r m        bookmark-set
C-x r b name   bookmark-jump
C-x r l        list-bookmarks


# Refcard Extended

C-x means character eXtend (followed by one character)
M-x means command eXtend (followed by a command)

C-x C-c save-buffers-kill-terminal (exit emacs)

M-x replace-string<Return>old-string<Return>new-string

M-q fill-paragraph

C-M-v  scroll-other-window
C-x ^  enlarge-window
C-x {  shrink-window-horizontally
C-x }  enlarge-window-horizontally


## Macros

F3	Start recording macro
F4	Stop recording macro
F4	Play back macro once
M-5 F4	Play back macro 5 times
