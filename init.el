(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
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

;; erlang mode
(add-to-list
   'load-path
       (car (file-expand-wildcards "/usr/lib/erlang/lib/tools-*/emacs")))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.yaws?$" . html-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(setq erlang-man-root-dir "/usr/lib/erlang/man")

(require 'erlang-start)
(require 'erlang-flymake)

;; distel
(add-to-list 'load-path "/home/yura/dev/distel/elisp")
(require 'distel)
(distel-setup)

;; haskell
(add-to-list 'load-path "~/dev/haskell-mode/")
(load "~/dev/haskell-mode/haskell-site-file.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'haskell-font-lock-symbols t)
(set 'haskell-font-lock-symbols t)
(put 'downcase-region 'disabled nil)

;; tabbar settings
(tabbar-mode 1)
;(setq tabbar-buffer-groups-function
;      (lambda ()
;        (list "All")))

;; ido
(require 'ido)
(ido-mode t)

(load-file "~/.emacs.d/erl-utils.el")
(load-file "~/.emacs.d/hotkeys.el")

