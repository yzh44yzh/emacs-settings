(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq-default indent-tabs-mode nil) ;; spaces instead of tabs
(setq-default tab-width 4)
(setq make-backup-files nil) 
(setq auto-save-default nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq mac-command-modifier 'meta)

(set-face-attribute 'default nil :font "Monaco-15")
(load-theme 'misterioso t)

;; (load-theme 'adwaita t)
;; (load-theme 'deeper-blue t) ;; good
;; (load-theme 'dichromacy t)
;; (load-theme 'light-blue t)
;; (load-theme 'manoj-dark t)
;; (load-theme 'misterioso t) ;; good
;; (load-theme 'tango t)
;; (load-theme 'tango-dark t) ;; good
;; (load-theme 'tsdh-dark t) ;; good
;; (load-theme 'tsdh-light t)
;; (load-theme 'wheatgrass t)
;; (load-theme 'whiteboard t)
;; (load-theme 'wombat t)

;; erlang mode
(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.10/emacs")

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.yaws?$" . html-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(setq erlang-man-root-dir "/usr/lib/erlang/man")

(require 'erlang-start)
;;(require 'erlang-flymake)  ;; doesn't work correctly with include_lib

;; distel
;;(add-to-list 'load-path "/home/yurazhloba/dev/distel/elisp")
;;(require 'distel)
;;(distel-setup)

;; haskell
(add-to-list 'load-path "~/dev/haskell-mode/")
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'haskell-font-lock-symbols t)
(set 'haskell-font-lock-symbols t)
(put 'downcase-region 'disabled nil)

;; ido
(require 'ido)
(ido-mode t)

(load-file "~/.emacs.d/erl-utils.el")
(load-file "~/.emacs.d/hotkeys.el")

