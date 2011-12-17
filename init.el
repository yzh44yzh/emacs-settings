;; C-x C-e compile
;; C-h k hotkey -- help about hotkey


(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1)

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn (color-theme-initialize)))
(color-theme-calm-forest)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode nil))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode nil)
    (setq default-vertical-scroll-bar nil))
  (blink-cursor-mode nil))

(load-file "~/.emacs.d/hotkeys.el")


