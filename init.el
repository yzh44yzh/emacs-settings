(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil) 
(setq auto-save-default nil)
(menu-bar-mode 0)
(set-face-attribute 'default nil :font "Ubuntu Mono-13")


(require 'color-theme)
(eval-after-load "color-theme"
  '(progn (color-theme-initialize)))

(color-theme-billw) ;; color theme for console mode

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode 0))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode nil)
    (setq default-vertical-scroll-bar nil))
  (blink-cursor-mode nil)
  (color-theme-arjen))

(load-file "~/.emacs.d/hotkeys.el")

;; erlang mode
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.6.3/emacs")

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.yaws?$" . html-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(setq erlang-man-root-dir "/usr/lib/erlang/man")

(require 'erlang-start)
(require 'erlang-flymake)

(load-file "~/.emacs.d/erl-utils.el")

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; tabbar settings
(tabbar-mode 1)
(setq tabbar-buffer-groups-function
      (lambda ()
        (list "All")))

;; ido
(require 'ido)
(ido-mode t)