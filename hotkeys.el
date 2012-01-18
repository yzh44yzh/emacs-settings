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


;; copy/paste to/from system buffer
;; super key is win key
(global-set-key (kbd "s-c") 'clipboard-kill-ring-save) 
(global-set-key (kbd "s-v") 'x-clipboard-yank)         


(global-set-key (kbd "C-z") 'undo)            ;; no default 
(global-set-key [M-return] 'complete-symbol)  ;; no default 


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
      (beginning-of-line)
      (let ((beg (point)))
      (end-of-line)
      (clipboard-kill-ring-save beg (point))
      (kill-ring-save beg (point))))))

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
      (beginning-of-line)
      (let ((beg (point)))
      (end-of-line)
      (clipboard-kill-ring-save beg (point))
      (kill-region beg (point))))))

(global-set-key (kbd "C-w") 'my-cut) ;; default is kill-region
