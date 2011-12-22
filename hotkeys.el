;; 57.4.6 Rebinding Keys in Your Init File
;; http://www.gnu.org/s/libtool/manual/emacs/Init-Rebinding.html

;; hjkl -- vim style cursor moving
(global-set-key (kbd "M-h") 'backward-char) ;; default is mark-paragraph
(global-set-key (kbd "M-j") 'next-line)     ;; default is indent-new-comment-line
(global-set-key (kbd "M-k") 'previous-line) ;; default is kill-sentence
(global-set-key (kbd "M-l") 'forward-char)  ;; default is downcase-word

;; switch buffers
(global-set-key [M-left] 'previous-buffer) ;; default is backword-word
(global-set-key [M-right] 'next-buffer)    ;; default is forward-word

;; copy, paste, cut
;; use C-insert, M-insert or standard keys:
;; C-w kill-region
;; M-w kill-ring-save
;; C-y yank

;; copy/paste to/from system buffer
;; super key is win key
(global-set-key (kbd "s-c") 'clipboard-kill-ring-save) 
(global-set-key (kbd "s-v") 'x-clipboard-yank)         

(global-set-key (kbd "C-z") 'undo)            ;; no default 
(global-set-key [M-return] 'complete-symbol)  ;; no default 

