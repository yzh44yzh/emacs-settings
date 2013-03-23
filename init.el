(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq make-backup-files nil) 
(setq auto-save-default nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq mac-command-modifier 'meta)

(set-face-attribute 'default nil :font "Monaco-15")
(load-theme 'wheatgrass t)

;; erlang mode
(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.7/emacs")

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.yaws?$" . html-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(setq erlang-man-root-dir "/usr/lib/erlang/man")

(require 'erlang-start)
;;(require 'erlang-flymake)  ;; doesn't work correctly with include_lib


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


;; Objective C
(defun my-objc-mode-hook ()
  (setq c-indent-level 4)
  (setq c-basic-offset 4))

(add-hook 'objc-mode-hook 'my-objc-mode-hook)

