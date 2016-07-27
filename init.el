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

(global-font-lock-mode t) ;; need for org-mode

(set-face-attribute 'default nil :font "Ubuntu Mono-13")
;;(set-frame-size (selected-frame) 100 33)

;;(load-theme 'tango t)       ;; 5 light
(load-theme 'tango-dark t)  ;; 5 dark
;;(load-theme 'tsdh-dark t)   ;; 5 dark
;;(load-theme 'wombat t)      ;; 5 dark
;;(load-theme 'wheatgrass t)  ;; 4 dark
;;(load-theme 'misterioso t)  ;; 4 dark
;;(load-theme 'deeper-blue t) ;; 3 dark
;;(load-theme 'manoj-dark t)  ;; 3 dark
;;(load-theme 'dichromacy t)  ;; 3 light
;;(load-theme 'tsdh-light t)  ;; 3 light
;;(load-theme 'whiteboard t)  ;; 3 light
;;(load-theme 'adwaita t)     ;; 2 light
;;(load-theme 'light-blue t)  ;; 2 light

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(load-file "~/.emacs.d/erl-utils.el")
(load-file "~/.emacs.d/hotkeys.el")


;; ------------
;; packages
;; ------------

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


;; -------------
;; ido
;; -------------

(require 'ido)
(ido-mode t)

(autoload 'ibuffer "ibuffer" "List buffers." t)


;; -------------
;; erlang mode
;; -------------

(add-to-list
   'load-path
       (car (file-expand-wildcards "/usr/local/lib/erlang/lib/erlang/lib/tools-*/emacs")))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.app\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*app\\.src\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.config\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.rel\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.script\\'" . erlang-mode))

(setq erlang-root-dir "/usr/local/lib/erlang")
(setq erlang-electric-commands nil) ;; http://www.erlang.org/doc/apps/tools/erlang_mode_chapter.html#id63595
(setq erlang-compile-outdir "../ebin")

(defvar erlang-compile-extra-opts
  '(bin_opt_info debug_info
                 (i . "../include")
                 ))

(require 'erlang-start)


;; -------------
;; flymake
;; -------------

(require 'erlang-flymake)

(setq flymake-log-level 1)

(defun flymake-compile-script-path (path)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list path (list local-file))))

;; https://github.com/ten0s/syntaxerl/
;; syntax checker tool for Erlang
(defun flymake-syntaxerl ()
  (flymake-compile-script-path "~/bin/syntaxerl"))

(add-hook 'erlang-mode-hook
  '(lambda()
     (add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.hrl\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.app\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.app.src\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.config\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.rel\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.script\\'" flymake-syntaxerl))

     ;; should be the last.
     (flymake-mode 1)
))


;; -------------
;; Ocaml
;; -------------

(require 'cl)
(require 'tuareg)

(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))

(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)


;; -------------
;; org-mode
;; -------------

(setq org-agenda-files (list
                        "~/Dropbox/org/community.org"
                        "~/Dropbox/org/dev.org"
                        "~/Dropbox/org/education.org"
                        "~/Dropbox/org/fizo.org"
                        "~/Dropbox/org/home.org"
                        "~/Dropbox/org/root.org"))
