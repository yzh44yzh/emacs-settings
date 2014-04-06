(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq show-paren-style 'expression)
(setq-default indent-tabs-mode nil) ;; spaces instead of tabs
(setq-default tab-width 4)
(setq make-backup-files nil)
(setq auto-save-default nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-auto-revert-mode t) ;; reverts any buffer associated with a file when the file changes on disk

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

;; -------------
;; erlang mode
;; -------------

(add-to-list
   'load-path
       (car (file-expand-wildcards "/usr/local/lib/erlang/lib/tools-*/emacs")))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.app\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*app\\.src\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.config\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.rel\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.script\\'" . erlang-mode))

(setq erlang-root-dir "/usr/local/lib/erlang")
(setq erlang-electric-commands nil)
(setq erlang-compile-outdir "../ebin")

(defvar erlang-compile-extra-opts
  '(bin_opt_info debug_info (i . "../include") (i . "../../include") (i . "../deps") (i . "../../") (i . "../../../deps")))

(require 'erlang-start)


;; -------------
;; flymake
;; -------------

(require 'erlang-flymake)

(setq flymake-log-level 3)

(defun flymake-compile-script-path (path)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list path (list local-file))))

;; https://github.com/ten0s/syntaxerl/
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
;; ido
;; -------------

(require 'ido)
(ido-mode t)


;; -------------
;; markdown
;; -------------

(load-file "~/.emacs.d/plugins/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(put 'downcase-region 'disabled nil)

(package-initialize)


;; -------------
;; org-mode
;; -------------

(setq org-agenda-files (list
                        "~/Dropbox/org/andr.org"
                        "~/Dropbox/org/education.org"
                        "~/Dropbox/org/emacs.org"
                        "~/Dropbox/org/fizo.org"
                        "~/Dropbox/org/fluxbox.org"
                        "~/Dropbox/org/home.org"
                        "~/Dropbox/org/loginov.org"
                        "~/Dropbox/org/music.org"
                        "~/Dropbox/org/root.org"
                        "~/Dropbox/org/ideas/ai-music.org"
                        "~/Dropbox/org/ideas/emacs-tutor.org"
                        "~/Dropbox/org/ideas/erlang-graph-db.org"
                        "~/Dropbox/org/ideas/erlang-school.org"
                        "~/Dropbox/org/ideas/light-thread.org"
                        "~/Dropbox/org/ideas/music-tutor.org"
                        "~/Dropbox/org/ideas/presentation-generator.org"
                        "~/Dropbox/org/ideas/record2proplist.org"
                        "~/Dropbox/org/ideas/self-education-planning-app.org"
                        "~/Dropbox/org/ideas/yzh44yzh.org"))


;; -------------
;; haskell-mode
;; -------------

(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode/")
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


;; ------------

(load-file "~/.emacs.d/erl-utils.el")
(load-file "~/.emacs.d/hotkeys.el")

(load-file "~/.emacs.d/plugins/ecmascript-mode.el")
(add-to-list 'auto-mode-alist '("\\.as?$" . ecmascript-mode))
