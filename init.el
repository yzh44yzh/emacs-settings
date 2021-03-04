(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq show-paren-style 'expression)
(setq-default indent-tabs-mode nil) ;; spaces instead of tabs
(setq-default tab-width 4)
(setq make-backup-files nil)
(setq auto-save-default t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-auto-revert-mode t) ;; reverts any buffer associated with a file when the file changes on disk
(setq-default sgml-basic-offset 4)

(if (eq system-type 'darwin)
  (set-face-attribute 'default nil :font "Monaco-17")
  (set-face-attribute 'default nil :font "Ubuntu Mono-15")
  )


(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)
  )

;; Color themes
;; Light:
(load-theme 'leuven t)
;; (load-theme 'dichromacy t)
;; (load-theme 'tsdh-light t)
;; (load-theme 'adwaita t) ;; grey
;; (load-theme 'light-blue t) ;; blue
;; (load-theme 'tango t) ;; grey
;; Dark:
;; (load-theme 'tango-dark t)
;; (load-theme 'deeper-blue t)
;; (load-theme 'manoj-dark t)
;; (load-theme 'misterioso t)
;; (load-theme 'tango-dark t)
;; (load-theme 'wheatgrass t)
;; (load-theme 'wombat t)
;; (load-theme 'tsdh-dark t)



(add-hook 'before-save-hook 'delete-trailing-whitespace)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


(require 'ido)
(ido-mode t)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;(load-file "~/.emacs.d/erlang.el")
;(load-file "~/.emacs.d/ocaml.el")
;(load-file "~/.emacs.d/yaml.el")

(load-file "~/.emacs.d/hotkeys.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cl-lib cl-lib-highlight rustic docker-compose-mode dockerfile-mode yaml-mode haskell-mode markdown-mode neotree cl-libify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
