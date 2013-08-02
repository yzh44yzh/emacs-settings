;; 57.4.6 Rebinding Keys in Your Init File
;; http://www.gnu.org/s/libtool/manual/emacs/Init-Rebinding.html

(global-set-key (kbd "C-z") 'undo)            ;; no default 
(global-set-key [C-return] 'complete-symbol)  ;; no default
(global-set-key (kbd "C-/") 'dabbrev-expand)  ;; default is undo
(global-set-key (kbd "C-M-s") 'grep) ;; default is isearch-forward-regexp
(global-set-key (kbd "C-M-r") 'query-replace) ;; default is isearch-backward-regexp

;; copy region if it exists 
;; or copy current line if region not exists
;; to internal and to system buffer
(defun my-copy()
  (interactive)
  (if (region-active-p)
      (save-excursion
	(clipboard-kill-ring-save (region-beginning) (region-end))
	(kill-ring-save (region-beginning) (region-end)))
    (save-excursion
      (clipboard-kill-ring-save (line-beginning-position) (+ 1 (line-end-position)))
      (kill-ring-save (line-beginning-position) (+ 1 (line-end-position))))))

(global-set-key (kbd "M-w") 'my-copy) ;; default is kill-ring-save


;; cut region if it exists 
;; or cut current line if region not exists
;; to internal and to system buffer
(defun my-cut()
  (interactive)
  (if (region-active-p)
      (progn
	(clipboard-kill-ring-save (region-beginning) (region-end))
	(kill-region (region-beginning) (region-end)))
    (progn
      (clipboard-kill-ring-save (line-beginning-position) (+ 1 (line-end-position)))
      (kill-region (line-beginning-position) (+ 1 (line-end-position))))))

(global-set-key (kbd "C-w") 'my-cut) ;; default is kill-region

;; duplicate line
(defun duplicate-line()
  (interactive)
  (kill-region (line-beginning-position) (+ 1 (line-end-position)))
  (yank)
  (yank)
  (previous-line))
(global-set-key (kbd "C-M-d") 'duplicate-line) 

(defun my-new-line()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key (kbd "C-j") 'my-new-line)

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
