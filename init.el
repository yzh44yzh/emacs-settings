(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq make-backup-files nil) 
(setq auto-save-default nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(set-face-attribute 'default nil :font "Ubuntu Mono-13")
(load-theme 'tango-dark t)

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
;; (require 'erlang-flymake) ;; doen't work correctly with include_lib

;; distel
;;(add-to-list 'load-path "/home/yura/dev/distel/elisp")
;;(require 'distel)
;;(distel-setup)

;; haskell
(add-to-list 'load-path "~/dev/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/lib/emacs/haskell-mode/")
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


;; markdown
(load-file "~/.emacs.d/plugins/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
