(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1)
(setq make-backup-files nil) 
(setq auto-save-default nil)
(menu-bar-mode -1)
(set-face-attribute 'default nil :font "Monaco-15")
;; (tabbar-mode 1)
(iswitchb-mode 1)
(setq mac-command-modifier 'meta)

;;(require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn (color-theme-initialize)))

;; (color-theme-billw) ;; color theme for console mode

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode 0))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode nil)
    (setq default-vertical-scroll-bar nil))
  (blink-cursor-mode nil)
  ;;(color-theme-calm-forest)
)

(load-file "~/.emacs.d/hotkeys.el")

;; erlang mode
(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.7/emacs")

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(setq erlang-man-root-dir "/usr/lib/erlang/man")

(require 'erlang-start)
;;(require 'erlang-flymake)

(load-file "~/.emacs.d/erl-utils.el")

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; (load-file "~/.emacs.d/server.el")


