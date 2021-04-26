(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq show-paren-style 'expression)
(setq parens-require-spaces nil) ;; do not add space before paren
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
(setq-default bookmark-save-flag 1) ;; save bookmarks on each change

(setq-default sentence-end "[.?!][]\"’)]*\\($\\|\t\\| \\)[ \t\n]*") ;; один пробел в конце предложения, а не два.
(setq-default sentence-end-double-space nil)

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
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)


(require 'ido)
(ido-mode t)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;; (load-file "~/.emacs.d/erlang.el")
;; (load-file "~/.emacs.d/ocaml.el")
;; (load-file "~/.emacs.d/yaml.el")

(load-file "~/.emacs.d/hotkeys.el")

;; projectile
;; https://docs.projectile.mx/projectile/index.html
(require 'projectile)
(setq projectile-project-search-path '("~/p/mypocket/" "~/Dropbox/org/"))
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(setq projectile-switch-project-action #'projectile-dired)

(require 'subr-x)
(recentf-mode 1)

(defun my-orgmode-config ()
  "For use in `orgmode-hook'."
  (local-set-key (kbd "C-y") 'kill-whole-line)  ;; default is org-return-indent
  (local-set-key (kbd "C-j") 'my-new-line) ;; default is org-yank
  )

(add-hook 'org-mode-hook 'my-orgmode-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile lua-mode elixir-mode cl-lib cl-lib-highlight rustic docker-compose-mode dockerfile-mode yaml-mode haskell-mode markdown-mode neotree cl-libify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
