;; 57.4.6 Rebinding Keys in Your Init File
;; http://www.gnu.org/s/libtool/manual/emacs/Init-Rebinding.html

;; Examples:
;; http://ergoemacs.org/emacs/keyboard_shortcuts_examples.html


;; General
(global-set-key (kbd "C-z") 'undo)  ;; default is to put emacs to background


;; Files & Buffers
(global-set-key (kbd "C-;") 'ido-switch-buffer) ;; convenient to press
(global-set-key (kbd "M-s M-s") 'save-buffer)
(global-set-key (kbd "C-x C-k") 'kill-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)       ;; shadows list-buffers


;; Move
;;
;; Vim-like cursor move
;;   i
;; j k l
;; https://tonsky.livejournal.com/314598.html
;;
;; to use <super> need to disable window action key:
;; Gnome Tweaks, Windows, Window Action Key: disabled
;;
(global-set-key (kbd "s-l") 'forward-char)
(global-set-key (kbd "s-j") 'backward-char)
(global-set-key (kbd "s-k") 'next-line)
(global-set-key (kbd "s-i") 'previous-line)
(global-set-key (kbd "C-s-l") 'forward-word)
(global-set-key (kbd "C-s-j") 'backward-word)

;; Edit
(global-set-key (kbd "C-S-j") 'delete-indentation)

;; Mark (Select)
(global-set-key (kbd "C-x C-h") 'mark-whole-buffer)  ;; default is 'Key translations ...'

;; Kill & Yank
(global-set-key (kbd "C-y") 'kill-whole-line)  ;; shadows yank

;; Search & Replace
(global-set-key (kbd "C-M-r") 'query-replace)  ;; shadows isearch-backward-regexp

;; Dev
(global-set-key [C-return] 'complete-symbol)
(global-set-key (kbd "C-/") 'comment-line)  ;; shadows undo

;; Windows
(global-set-key "\C-o" 'other-window)  ;; shadows open-line

;; Neotree
(global-set-key (kbd "<f3>") 'neotree-toggle)
(global-set-key (kbd "<f4>") 'neotree-find)


;; copy region if it exists
;; or copy current line if region not exists
;; copy to internal and to system buffer
(defun my-copy()
  (interactive)
  (if (region-active-p)
      (save-excursion
	(clipboard-kill-ring-save (region-beginning) (region-end))
	(kill-ring-save (region-beginning) (region-end)))
    (save-excursion
      (clipboard-kill-ring-save (line-beginning-position) (+ 1 (line-end-position)))
      (kill-ring-save (line-beginning-position) (+ 1 (line-end-position))))))
(global-set-key (kbd "C-<insert>") 'my-copy)


;; cut region if it exists
;; or cut current line if region not exists
;; cut to internal and to system buffer
(defun my-cut()
  (interactive)
  (if (region-active-p)
      (progn
	(clipboard-kill-ring-save (region-beginning) (region-end))
	(kill-region (region-beginning) (region-end)))
    (progn
      (clipboard-kill-ring-save (line-beginning-position) (+ 1 (line-end-position)))
      (kill-region (line-beginning-position) (+ 1 (line-end-position))))))
(global-set-key (kbd "S-<delete>") 'my-cut)


(defun duplicate-line()
  (interactive)
  (setq kill-ring nil)
  (beginning-of-line)
  (kill-line)
  (yank)
  (newline)
  (yank)
  (setq kill-ring nil))
(global-set-key (kbd "C-d") 'duplicate-line)


(defun my-new-line()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key (kbd "C-j") 'my-new-line) ;; default is newline-and-indent
(global-set-key (kbd "S-<return>") 'my-new-line) ;; default is newline-and-indent


(defun grep-word-at-point()
  (interactive)
  (setq arg (format "grep -nH -e %s *" (word-at-point)))
  (grep arg))
(global-set-key (kbd "M-s s") 'grep-word-at-point)


(defun insert_org_code ()
  (interactive)
  (beginning-of-line)
  (insert "#+BEGIN_SRC Erlang\n")
  (insert "\n")
  (insert "#+END_SRC\n")
  (previous-line)
  (previous-line)
  (beginning-of-line))
(global-set-key (kbd "<f5>") 'insert_org_code)


(defun normal-font ()
  (interactive)
  (set-face-attribute 'default nil :font "Ubuntu Mono-13"))
(global-set-key (kbd "<f9>") 'normal-font)


(defun presentation-font ()
  (interactive)
  (set-face-attribute 'default nil :font "Ubuntu Mono-22"))
(global-set-key (kbd "<f8>") 'presentation-font)


; @author Nikita Danilov http://www.cofault.com/2011/12/cue-key.html
;
; Map Modifier-CyrillicLetter to the underlying Modifier-LatinLetter, so that
; control sequences can be used when keyboard mapping is changed outside of
; Emacs.
;
; For this to work correctly, .emacs must be encoded in the default coding
; system.
;
(require 'cl)
(mapcar*
 (lambda (r e) ; R and E are matching Russian and English keysyms
   ; iterate over modifiers
   (mapc (lambda (mod)
    (define-key input-decode-map
      (vector (list mod r)) (vector (list mod e))))
  '(control meta super hyper))
   ; finally, if Russian key maps nowhere, remap it to the English key without
   ; any modifiers
   (define-key local-function-key-map (vector r) (vector e)))
   "йцукенгшщзхъфывапролджэячсмитьбю"
   "qwertyuiop[]asdfghjkl;'zxcvbnm,.")

(global-set-key (kbd "M-Б") 'beginning-of-buffer)
(global-set-key (kbd "M-Ю") 'end-of-buffer)
