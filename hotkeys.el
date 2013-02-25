;; 57.4.6 Rebinding Keys in Your Init File
;; http://www.gnu.org/s/libtool/manual/emacs/Init-Rebinding.html

;; switch buffers
(global-set-key [M-left] 'previous-tab-or-buffer) ;; default is backword-word
(global-set-key [M-right] 'next-tab-or-buffer) ;; default is forward-word
(global-set-key [S-M-left] 'tabbar-backward-group)
(global-set-key [S-M-right] 'tabbar-forward-group)
;; c-c c-home tabbar-press-home show all tabbar groups

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


